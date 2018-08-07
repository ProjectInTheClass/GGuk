//
//  buttonViewController.swift
//  GGuk
//
//  Created by CAUAD23 on 2018. 7. 26..
//  Copyright © 2018년 CAUAD23. All rights reserved.
//
//
//  buttonViewController.swift
//  GGuk
//
//  Created by CAUAD23 on 2018. 7. 26..
//  Copyright © 2018년 CAUAD23. All rights reserved.
//
import UIKit

class ButtonView: UIView {
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    @IBOutlet weak var bu: UIButton!
   }
class Button {
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    var button:UIButton
   
    //var buttonImage:UIImage
    init(button:UIButton) {
        self.button = button
       // self.buttonImage = buttonImage
    }
    /*
    func drawButtonImage () {
        button.setImage(image: UIImage, for: <#T##UIControlState#>)
    }
    */
    
    //버튼크기 작게
    
    
    
    func changeSizeDown(button:UIButton) {
        button.imageEdgeInsets = UIEdgeInsetsMake(3, 3, 3, 3)
    }
    //버튼크기 크게
    func changeSizeUp(button:UIButton) {
        button.imageEdgeInsets = UIEdgeInsetsMake(-3, -3, -3, -3)
    }
    //버튼에 그림자
    func setShadowColor(button:UIButton){
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        button.layer.masksToBounds = false
        button.layer.shadowRadius = 1.0
        button.layer.shadowOpacity = 0.5
        button.layer.cornerRadius = button.frame.width / 2
    }
    
}


class buttonViewController: UIViewController{

    //var blueCircle:button = button(button: , buttonImage: UIImage(named: "blueCircle"))
    
    var buttonSound = sound(soundName: "btnSound")
    @IBOutlet weak var b: UIButton!
    
    //버튼크기 작게
    func changeSizeDown(button:UIButton) {
        button.imageEdgeInsets = UIEdgeInsetsMake(3, 3, 3, 3)
    }
    //버튼크기 크게
    func changeSizeUp(button:UIButton) {
        button.imageEdgeInsets = UIEdgeInsetsMake(-3, -3, -3, -3)
    }
    //버튼에 그림자
    func setShadowColor(button:UIButton){
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        button.layer.masksToBounds = false
        button.layer.shadowRadius = 1.0
        button.layer.shadowOpacity = 0.5
        button.layer.cornerRadius = button.frame.width / 2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    //빨간원 클릭했을때 반응
    @IBAction func buttonTouchDown(_ sender: UIButton) {
          changeSizeDown(button: sender)
          setShadowColor(button: sender)
          buttonSound.playSound()
    
    }
    @IBAction func buttonTouchUpInside(_ sender: UIButton) {
        changeSizeUp(button: sender)
        
        
        
    }
    
    /*
    @IBAction func buttonClick(button: UIButton){
        changeSizeDown(button: button)
    }
    */
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    


}
