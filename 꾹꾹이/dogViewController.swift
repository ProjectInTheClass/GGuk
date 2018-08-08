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
    
    
    @IBOutlet weak var boneImage: UIImageView!
    @IBOutlet weak var dogImage: UIImageView!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var countLabel: UILabel!
    

    @IBOutlet weak var boneY: NSLayoutConstraint!
    @IBOutlet weak var boneX: NSLayoutConstraint!
    
    var leftUp = false
    var rightUp = false
    var dogSound = sound(soundName: "dv")
    var alertCon = PopUp()
    var counter = Counter()
    
   /*
    func printCount() {
        self.countLabel.text = "\(alertCon.count)"
        
    }
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dogImage.image = UIImage(named: "standard")!
        boneImage.image = UIImage(named:"bone")
        counter.printCount(countLabel: countLabel)
    }
    
    //뼈움직이는거
    @IBAction func handlePan(recognizer:UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: self.view)
        if let view = recognizer.view {
            view.center = CGPoint(x:view.center.x + translation.x,
                                  y:view.center.y + translation.y)
            if((view.center.x >= 150 && view.center.x <= 200) && (view.center.y >= 350 && view.center.y <= 400)){
                dogSound.playSound()
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
        counter.printCount(countLabel: countLabel)
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
        counter.printCount(countLabel: countLabel)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
}


