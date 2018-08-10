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
    var startX:CGFloat?
    var startY:CGFloat?
    
    var leftUp = false
    var rightUp = false
    var dogSound = sound(soundName: "dv")
    var boneSound = sound(soundName : "puppy")
    var alertCon = PopUp()
    var counter = Counter()
    let defaults = UserDefaults.standard
    
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
        counter.printCount(countLabel: countLabel)
    }
    
    @IBAction func replayButton(_ sender: UIBarButtonItem) {
        counter.count = 0
        defaults.set(counter.count, forKey: "coinCnt")
        counter.printCount(countLabel: countLabel)
        
        dogImage.image = UIImage(named: "standard")!
        self.boneX.constant = startX!
        self.boneY.constant = startY!
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
        
        if let newScreen = alertCon.printMessage(count: counter.count){
            self.present(newScreen, animated: true, completion: nil)
        }
        
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
        
        if let newScreen = alertCon.printMessage(count: counter.count){
            self.present(newScreen, animated: true, completion: nil)
        }
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
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.35) {
                snack.transform = CGAffineTransform(scaleX: -2, y: -2)
            }
        }, completion: nil)

        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}
