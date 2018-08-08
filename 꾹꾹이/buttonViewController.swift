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
import AudioToolbox



class buttonViewController: UIViewController{

    var buttonSound = sound(soundName: "btnSound")
    let impact = UIImpactFeedbackGenerator()
    
    @IBOutlet weak var countLabel: UILabel!
    var counter = Counter()
    let defaults = UserDefaults.standard
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
        if let count = defaults.value(forKey: "btnCnt"){
            counter.count = count as! Int
        }
        counter.printCount(countLabel: countLabel)

    }
    //원 클릭했을때 반응
    @IBAction func buttonTouchDown(_ sender: UIButton) {
        changeSizeDown(button: sender)
        setShadowColor(button: sender)
        buttonSound.playSound()
        counter.count += 1
        counter.printCount(countLabel: countLabel)
        defaults.set(counter.count, forKey: "btnCnt")
        //AudioServicesPlaySystemSound(4095)
        //AudioServicesPlaySystemSound(1015)

    }
    @IBAction func buttonTouchUpInside(_ sender: UIButton) {
        changeSizeUp(button: sender)
        //AudioServicesPlaySystemSound(4095)
        impact.impactOccurred()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    


}
