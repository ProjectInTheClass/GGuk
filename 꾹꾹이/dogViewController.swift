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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dogImage.image = UIImage(named: "standard")!
        boneImage.image = UIImage(named:"bone")
        
    }
    
    
    var leftUp = false
    var rightUp = false
    
    var player: AVAudioPlayer?
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: "dv", withExtension: "m4a")
            else {
            print("url not found")
            return
        }
        
        do {
            /// this codes for making this app ready to takeover the device audio
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            /// change fileTypeHint according to the type of your audio file (you can omit this)
            
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3)
            
            // no need for prepareToPlay because prepareToPlay is happen automatically when calling play()
            player!.play()
        } catch let error as NSError {
            print("error: \(error.localizedDescription)")
        }
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
        
        
        playSound()
        
        
        
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
        
        playSound()
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
