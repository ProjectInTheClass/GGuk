//
//  buttonViewController.swift
//  GGuk
//
//  Created by CAUAD23 on 2018. 7. 26..
//  Copyright © 2018년 CAUAD23. All rights reserved.
<<<<<<< HEAD
=======
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
>>>>>>> 739209cc30203fbe968f7d5e4926d4be240b5af6

import UIKit

class buttonViewController: UIViewController{
<<<<<<< HEAD
    
    var count = 0
    var buttonSound = sound(soundName: "btnSound")
    @IBOutlet weak var countLabel: UILabel!
=======

    //var blueCircle:button = button(button: , buttonImage: UIImage(named: "blueCircle"))
    
    var buttonSound = sound(soundName: "btnSound")
    @IBOutlet weak var b: UIButton!
>>>>>>> 739209cc30203fbe968f7d5e4926d4be240b5af6
    
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
    func printCount(){
        countLabel.text = "\(count)"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
<<<<<<< HEAD
        printCount()
=======


>>>>>>> 739209cc30203fbe968f7d5e4926d4be240b5af6
    }
    //버튼클릭
    @IBAction func buttonTouchDown(_ sender: UIButton) {
<<<<<<< HEAD
        changeSizeDown(button: sender)
        setShadowColor(button: sender)
        buttonSound.playSound()
        count += 1
        printCount()
=======
          changeSizeDown(button: sender)
          setShadowColor(button: sender)
          buttonSound.playSound()
    
>>>>>>> 739209cc30203fbe968f7d5e4926d4be240b5af6
    }
    @IBAction func buttonTouchUpInside(_ sender: UIButton) {
        changeSizeUp(button: sender)
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    


}
