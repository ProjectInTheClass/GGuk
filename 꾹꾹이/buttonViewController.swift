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
class buttonViewController: UIViewController{
    
    var buttonSound:sound?
    @IBOutlet weak var countLabel: UILabel!
    var counter = Counter()
    let defaults = UserDefaults.standard
    
    @IBOutlet var buttons: [UIButton]!
    
    //버튼크기 작게
    func changeSizeDown(button:UIButton) {
        
        switch button.tag {
        case 0://오리
            button.imageEdgeInsets = UIEdgeInsetsMake(12, 2, 12, 2)
        case 1://와인잔
            button.imageEdgeInsets = UIEdgeInsetsMake(2, 15, 2, 15)
        case 2://물방울
            button.imageEdgeInsets = UIEdgeInsetsMake(2, 13, 2, 13)
        case 3://구름
            button.imageEdgeInsets = UIEdgeInsetsMake(28, 1, 28, 1)
        case 4://고양이
            button.imageEdgeInsets = UIEdgeInsetsMake(3, 3, 3, 3)
        case 5://하트
            button.imageEdgeInsets = UIEdgeInsetsMake(3, 3, 3, 3)
        case 6://과자
            button.imageEdgeInsets = UIEdgeInsetsMake(3, 3, 3, 3)
        case 7://달
            button.imageEdgeInsets = UIEdgeInsetsMake(2, 13, 2, 13)
        default://마우스
            button.imageEdgeInsets = UIEdgeInsetsMake(1, 25, 1, 25)
        }
        
        
    }
    //버튼크기 크게
    func changeSizeUp(button:UIButton) {
        switch button.tag {
        case 0://오리
            button.imageEdgeInsets = UIEdgeInsetsMake(-12, -2, -12, -2)
        case 1://와인잔
            button.imageEdgeInsets = UIEdgeInsetsMake(-2, -15, -2, -15)
        case 2://물방울
            button.imageEdgeInsets = UIEdgeInsetsMake(-2, -13, -2, -13)
        case 3://구름
            button.imageEdgeInsets = UIEdgeInsetsMake(-28, -1, -28, -1)
        case 4://고양이
            button.imageEdgeInsets = UIEdgeInsetsMake(-3, -3, -3, -3)
        case 5://하트
            button.imageEdgeInsets = UIEdgeInsetsMake(-3, -3, -3, -3)
        case 6://과자
            button.imageEdgeInsets = UIEdgeInsetsMake(-3, -3, -3, -3)
        case 7://달
            button.imageEdgeInsets = UIEdgeInsetsMake(-2, -13, -2, -13)
        default://마우스
            button.imageEdgeInsets = UIEdgeInsetsMake(-1, -25, -1, -25)
        }
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
    
    @IBAction func replayButton(_ sender: UIBarButtonItem) {
        counter.count = 0
        defaults.set(counter.count, forKey: "btnCnt")
        counter.printCount(countLabel: countLabel)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0 ... buttons.count - 1{
            setShadowColor(button: buttons[i])
        }
        if let count = defaults.value(forKey: "btnCnt"){
            counter.count = count as! Int
        }
        counter.printCount(countLabel: countLabel)
        
    }
    //원 클릭했을때 반응
    @IBAction func buttonTouchDown(_ sender: UIButton) {
        changeSizeDown(button: sender)
        
        setSound(tag: sender.tag)
        counter.count += 1
        counter.printCount(countLabel: countLabel)
        defaults.set(counter.count, forKey: "btnCnt")
    }
    
    @IBAction func buttonTouchUpInside(_ sender: UIButton) {
        
        changeSizeUp(button: sender)
        
    }
    
    func setSound(tag:Int){
        switch tag {
        case 0://오리
            buttonSound = sound(soundName: "btnSound")
            buttonSound?.playSound()
        case 1://와인잔
            buttonSound = sound(soundName: "btnSound")
            buttonSound?.playSound()
        case 2://물방울
            buttonSound = sound(soundName: "btnSound")
            buttonSound?.playSound()
        case 3://구름
            buttonSound = sound(soundName: "btnSound")
            buttonSound?.playSound()
        case 4://고양이
            buttonSound = sound(soundName: "btnSound")
            buttonSound?.playSound()
        case 5://하트
            buttonSound = sound(soundName: "btnSound")
            buttonSound?.playSound()
        case 6://과자
            buttonSound = sound(soundName: "btnSound")
            buttonSound?.playSound()
        case 7://달
            buttonSound = sound(soundName: "btnSound")
            buttonSound?.playSound()
        default://마우스
            buttonSound = sound(soundName: "btnSound")
            buttonSound?.playSound()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    
}
