//
//  buttonViewController.swift
//  GGuk
//
//  Created by CAUAD23 on 2018. 7. 26..
//  Copyright © 2018년 CAUAD23. All rights reserved.

import UIKit

class buttonViewController: UIViewController{
    
    var count = 0
    var buttonSound = sound(soundName: "btnSound")
    @IBOutlet weak var countLabel: UILabel!
    
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
        printCount()
    }
    //버튼클릭
    @IBAction func buttonTouchDown(_ sender: UIButton) {
        changeSizeDown(button: sender)
        setShadowColor(button: sender)
        buttonSound.playSound()
        count += 1
        printCount()
    }
    @IBAction func buttonTouchUpInside(_ sender: UIButton) {
        changeSizeUp(button: sender)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    


}
