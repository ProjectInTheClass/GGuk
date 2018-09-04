import UIKit
//발자국 클래스
class PawViewController: UIViewController {
    
    @IBOutlet weak var countLabel: UILabel!
    let pawImage = UIImage(named: "pawe")
    var snowSound:sound?
    
    var counter = Counter()
    //저장을 위해서
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let count = defaults.value(forKey: "pawCnt"){
            counter.count = count as! Int
        }
        counter.printCount(countLabel: countLabel)
    }
    
    @IBAction func replayButton(_ sender: UIBarButtonItem) {
        counter.count = 0
        defaults.set(counter.count, forKey: "pawCnt")
        counter.printCount(countLabel: countLabel)
    }
    
    func setImageView(x:CGFloat, y:CGFloat){
        let imageView = UIImageView()
        //화면 클릭한곳의 가운데 위치하도록
        imageView.frame = CGRect(x: x - 20, y: y - 15, width: 40, height: 30)
        imageView.image = pawImage
        
        self.view.addSubview(imageView)
        counter.count += 1
        
        /*
        //일정만큼 클릭하면 발자국 찍히도록
        if(counter.showAction() == true){
            makeBigPaw()
        }
        */
        
        //snow 사운드 여러개
        switch (counter.count) % 4 {
        case 0:
            snowSound = sound(soundName: "snow")
        case 1:
            snowSound = sound(soundName: "snow2")
        case 2:
            snowSound = sound(soundName: "snow3")
        default:
            snowSound = sound(soundName: "snow4")
        }
        
        snowSound!.playSound()
        
        counter.printCount(countLabel: countLabel)
        
        //alpht = 밝기 -> 1에서 0으로 가면서 fade out
        imageView.alpha = 1
        UIView.animate(withDuration: 5, animations: {
            imageView.alpha = 0
        })
        defaults.set(counter.count, forKey: "pawCnt")
    }
    
    //드래그동작을 위해
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch:UITouch = touches.first!
        let startPoint = touch.location(in: self.view)
        let touchX = startPoint.x
        let touchY = startPoint.y
        setImageView(x: touchX, y: touchY)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        let touch: UITouch = touches.first!
        let startPoint:CGPoint = touch.location(in: self.view)
        let touchX = startPoint.x
        let touchY = startPoint.y
        //터치 좌표를 가지고 넣어준다.
        setImageView(x: touchX, y: touchY)
    }
    
    /*
    func makeBigPaw() {
        let paws = UIImageView(frame: CGRect(x:-30 , y:250, width: 500, height: 350))
        paws.image = UIImage(named: "pawe")
        paws.alpha = 1
        self.view.addSubview(paws)
        UIView.animate(withDuration: 3, animations: {
            paws.alpha = 0})
    }
 */
}

