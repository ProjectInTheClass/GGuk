//
//  dogViewController.swift
//  GGuk
//
//  Created by CAUAD23 on 2018. 7. 31..
//  Copyright © 2018년 CAUAD23. All rights reserved.
//

import UIKit
import AVFoundation


class dogViewController: UIViewController {
    
<<<<<<< HEAD
=======
    
>>>>>>> 739209cc30203fbe968f7d5e4926d4be240b5af6
    @IBOutlet weak var boneImage: UIImageView!
    @IBOutlet weak var dogImage: UIImageView!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var countLabel: UILabel!
<<<<<<< HEAD
    
    var leftUp = false
    var rightUp = false
    
    var dogSound = sound(soundName: "dv")
    var alertCon = PopUp()
    
    func printCount() {
        self.countLabel.text = "\(alertCon.count)"
=======
    
    
    var leftUp = false
    var rightUp = false
    var dogSound = sound(soundName: "dv")
    var alertCon = PopUp()
    
    
    func printCount() {
        self.countLabel.text = "\(alertCon.count)"
        
>>>>>>> 739209cc30203fbe968f7d5e4926d4be240b5af6
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dogImage.image = UIImage(named: "standard")!
        boneImage.image = UIImage(named:"bone")
        
    }
<<<<<<< HEAD
    //뼈다귀 움직이게
=======
    
>>>>>>> 739209cc30203fbe968f7d5e4926d4be240b5af6
    @IBAction func handlePan(recognizer:UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: self.view)
        if let view = recognizer.view {
            view.center = CGPoint(x:view.center.x + translation.x,
                                  y:view.center.y + translation.y)
        }
        recognizer.setTranslation(CGPoint.zero, in: self.view)
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
        
        alertCon.count += 1
        dogSound.playSound()
<<<<<<< HEAD
        alertCon.printMessage()
        printCount()
        }
    
    
=======
        viewDidAppear(true)

    }
>>>>>>> 739209cc30203fbe968f7d5e4926d4be240b5af6
    
    
    
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
        
        alertCon.count += 1
        dogSound.playSound()
<<<<<<< HEAD
        alertCon.printMessage()
        printCount()
    }

=======
        viewDidAppear(true)
        
        
    }

    
    override func viewDidAppear(_ animated: Bool) {
        
        //super.viewDidAppear(animated)
        //if(count == 3 * alertCounter){
       //     self.showAlertMsg(title: "축", message: "\(3 * alertCounter)번이나 클릭하셨어요!", time: 3)
        //    alertCounter += 1
       // }
        
        alertCon.printMessage()
        printCount()
        
        
    }
    
>>>>>>> 739209cc30203fbe968f7d5e4926d4be240b5af6

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    }


