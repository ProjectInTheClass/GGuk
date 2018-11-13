import UIKit
import AVFoundation

class dogViewController: UIViewController {
    
    
    @IBOutlet weak var boneImage: UIImageView!
    @IBOutlet weak var dogImage: UIImageView!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var countLabel: UILabel!
    
    @IBOutlet weak var boneLabel: UILabel!
    
    @IBOutlet weak var boneY: NSLayoutConstraint!
    @IBOutlet weak var boneX: NSLayoutConstraint!
    //뼈다귀 초기 위치 저장
    var startX:CGFloat?
    var startY:CGFloat?
    
    var leftUp = false
    var rightUp = false
    var dogSound = sound(soundName: "dv")
    var boneSound = sound(soundName : "puppy")
    var snackSound = sound(soundName: "doggy")
    
    var counter = Counter()
    let defaults = UserDefaults.standard
    var snackCount:Int = 0
    
    var imageView:UIImageView!
    var eatenBone:[UIImageView?] = []
    var lastBoneLocation:CGPoint!//쌓인 뼈다귀의 마지막 위치
    
    
    //해야할것: 뼈다귀 마지막 위치에서 위에 쌓이는거..
    //snack객체 삭제해주기..

    override func viewDidLoad() {
        super.viewDidLoad()
        startX = boneX.constant
        startY = boneY.constant
        
        dogImage.image = UIImage(named: "standard")!
        boneImage.image = UIImage(named:"bone")
        boneLabel.font = UIFont(name: "Silkscreen-Expanded", size: 20)
        
        if let count = defaults.value(forKey: "dogCnt"){
            counter.count = count as! Int
        }
        
        if let sCount = defaults.value(forKey: "eatBoneCnt"){
            self.snackCount = sCount as! Int
        }
        
        if(snackCount != 0){
            for i in 0...snackCount - 1 {
                imageView = UIImageView()
                imageView.frame = CGRect(x: 0, y: 30 * (i + 3), width: 40, height: 30)
                imageView.image = boneImage.image
                self.view.addSubview(imageView)
                eatenBone.append(imageView)
                lastBoneLocation = CGPoint(x: 0, y: 30*(i+3))
                
            }
        }
        else{
            lastBoneLocation = CGPoint(x: 0, y: 60)
        }
        counter.printCount(countLabel: countLabel)
        
    }
    
    @IBAction func replayButton(_ sender: UIBarButtonItem) {

        for i in 0...snackCount - 1{
            eatenBone[snackCount - i - 1]?.removeFromSuperview()
        }
        eatenBone.removeAll()
        
        counter.count = 0
        snackCount = 0
        defaults.set(counter.count, forKey: "dogCnt")
        defaults.set(snackCount,forKey:"eatBoneCnt")
        
        counter.printCount(countLabel: countLabel)
        
        dogImage.image = UIImage(named: "standard")!
        self.boneX.constant = startX!
        self.boneY.constant = startY!

        lastBoneLocation = CGPoint(x: 0, y: 60)
        
    }
    
    //뼈움직이는거
    @IBAction func handlePan(recognizer:UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: self.view)
        let dogX = dogImage.center.x
        let dogY = dogImage.center.y
        
        if let view = recognizer.view {
            boneLabel.alpha = 0
            view.center = CGPoint(x:view.center.x + translation.x,
                                  y:view.center.y + translation.y)
            
            //뼈다귀가 입에가면 멍멍
            if((view.center.x >= dogX - 20 && view.center.x <= dogX) && (view.center.y >= dogY - 20 && view.center.y <= dogY)){
                boneSound.playSound()
            }
        }
        recognizer.setTranslation(CGPoint.zero, in: self.view)
        self.boneX.constant += translation.x
        self.boneY.constant += translation.y
    }
    
    
    @IBAction func clickLeft(_ sender: UIButton) {
        
        //귀모양 사진
        if(leftUp == true && rightUp == true){
            dogImage.image = UIImage(named: "right")!
        }
        else if(leftUp == false && rightUp == true){
            dogImage.image = UIImage(named: "merong")!
            
        }
        else if(leftUp == false && rightUp == false){
            dogImage.image = UIImage(named: "left")!
            
        }
        else {
            dogImage.image = UIImage(named: "standard")!
        }
        
        if(leftUp == false){
            leftUp = true
        }
        else{
            leftUp = false
        }
        counter.count += 1
        dogSound.playSound()
        
        if(counter.showAction() == true){
            printSnack()
        }
        counter.printCount(countLabel: countLabel)
        defaults.set(counter.count, forKey: "dogCnt")
    }
    
    
    @IBAction func clickRight(_ sender: Any) {
        
        if(leftUp == true && rightUp == true){
            dogImage.image = UIImage(named: "left")!
        }
        else if(leftUp == false && rightUp == true){
            dogImage.image = UIImage(named: "standard")!
            
        }
        else if(leftUp == false && rightUp == false){
            dogImage.image = UIImage(named: "right")!
            
        }
        else {
            dogImage.image = UIImage(named: "merong")!
        }
        
        if(rightUp == false){
            rightUp = true
        }
        else{
            rightUp = false
        }
        
        counter.count += 1
        dogSound.playSound()
        
        if(counter.showAction() == true){
            printSnack()
        }
        counter.printCount(countLabel: countLabel)
        defaults.set(counter.count, forKey: "dogCnt")
    }
    
    func printSnack() {
        let snack = UIImageView(frame: CGRect(x:10 , y:280, width: 400, height: 150))
        snack.image = UIImage(named: "snack")
        snack.alpha = 1
        self.view.addSubview(snack)
 
        UIView.animateKeyframes(withDuration: 3, delay: 0, options: .calculationModeCubic, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5) {
                snack.transform = CGAffineTransform(scaleX: 0.25, y: 0.25)
            }
        }, completion: nil)
        
        UIView.animate(withDuration: 2, animations: {
            snack.alpha = 0
        })
        snackCount += 1
        
        defaults.set(snackCount, forKey: "eatBoneCnt")
        afterEatSnack()
    }
    
    func afterEatSnack(){
        
        imageView = UIImageView()
        imageView.frame = CGRect(x: 0, y: lastBoneLocation.y + 30, width: 40, height: 30)
        lastBoneLocation = CGPoint(x: 0, y: lastBoneLocation.y + 30)
        imageView.image = boneImage.image
        self.view.addSubview(imageView)
      
        eatenBone.append(imageView)
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}
