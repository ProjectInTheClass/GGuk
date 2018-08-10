//
//  Coin.swift
//  GGuk
//
//  Created by CAUAD22 on 2018. 8. 8..
//  Copyright © 2018년 CAUAD23. All rights reserved.
//

import UIKit

class Coin: UIViewController {

   
    
    @IBOutlet var btnCoin: [UIButton]!
    @IBOutlet weak var countLabel: UILabel!
    
    var counter = Counter()
    var coinSound = sound(soundName: "coin")
    var specialSound = sound(soundName: "coinflip")
    
    var front: [Bool] = []
    var randomNum:UInt32?
    var randomNum1:UInt32?
    var randomNum2:UInt32?
    var randomNum3:UInt32?
    var randomNum4:UInt32?
    var randomNum5:UInt32?
    var randomNum6:UInt32?
    var randomNum7:UInt32?
    
    let defaults = UserDefaults.standard
    var startBtnLocation:CGPoint?
    var startTag:Int?
    var num = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        randomNum1 = arc4random_uniform(UInt32(btnCoin.count - 1))
        randomNum2 = arc4random_uniform(UInt32(btnCoin.count - 1))
        randomNum3 = arc4random_uniform(UInt32(btnCoin.count - 1))
        randomNum4 = arc4random_uniform(UInt32(btnCoin.count - 1))
        randomNum5 = arc4random_uniform(UInt32(btnCoin.count - 1))
        randomNum6 = arc4random_uniform(UInt32(btnCoin.count - 1))
        randomNum7 = arc4random_uniform(UInt32(btnCoin.count - 1))
        
        if let count = defaults.value(forKey: "coinCnt"){
            counter.count = count as! Int
        }
        counter.printCount(countLabel: countLabel)
        // Do any additional setup after loading the view.
        for i in 0...btnCoin.count - 1 {
            btnCoin[i].setImage(UIImage(named: "coin1"), for: .normal)
            front.append(false)
            setShadowColor(button: btnCoin[i])
        }
      
    }
    @IBAction func replayBtn(_ sender: UIBarButtonItem) {
        counter.count = 0
        defaults.set(counter.count, forKey: "coinCnt")
        counter.printCount(countLabel: countLabel)
        
        for i in 0...btnCoin.count - 1 {
            btnCoin[i].setImage(UIImage(named: "coin1"), for: .normal)
            front.append(false)
            setShadowColor(button: btnCoin[i])
        }
    }
    
    func setShadowColor(button:UIButton){
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        button.layer.masksToBounds = false
        button.layer.shadowRadius = 1.0
        button.layer.shadowOpacity = 0.5
        button.layer.cornerRadius = button.frame.width / 2
    }
    @IBAction func btnFlip(_ sender: UIButton) {
        startBtnLocation = sender.center
        startTag = sender.tag
        
        
        if front[sender.tag] {
            front[sender.tag] = false
            sender.setImage(UIImage(named: "coin1"), for: .normal)
            coinSound.playSound()
            counter.count += 1
            UIView.transition(with: sender, duration: 0.2, options: .transitionFlipFromLeft, animations: nil, completion: nil)
            counter.printCount(countLabel: countLabel)
            defaults.set(counter.count, forKey: "coinCnt")
        }
        else {
            front[sender.tag] = true
            
            switch sender.tag {
            case Int(randomNum1!):
                randomNum1 = specialBtn(randomNum: randomNum1!, sender: sender)
                
            case Int(randomNum2!):
                randomNum2 = specialBtn(randomNum: randomNum2!, sender: sender)
                
            case Int(randomNum3!):
                randomNum3 = specialBtn(randomNum: randomNum3!, sender: sender)
                
            case Int(randomNum4!):
                randomNum4 = specialBtn(randomNum: randomNum4!, sender: sender)
                
            case Int(randomNum5!):
                randomNum5 = specialBtn(randomNum: randomNum5!, sender: sender)
                
            case Int(randomNum6!):
                randomNum6 = specialBtn(randomNum: randomNum6!, sender: sender)
                
            case Int(randomNum7!):
                randomNum7 = specialBtn(randomNum: randomNum7!, sender: sender)
                
            default:
                sender.setImage(UIImage(named: "coin2"), for: .normal)
                UIView.transition(with: sender, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                coinSound.playSound()
            }

            counter.count += 1
            counter.printCount(countLabel: countLabel)
            defaults.set(counter.count, forKey: "coinCnt")
        }
        }
    
    func specialBtn(randomNum:UInt32, sender:UIButton) -> UInt32{
       
        switch num {
        case 0:
            sender.setImage(UIImage(named: "turtle"), for: .normal)
            num += 1
        case 1:
            sender.setImage(UIImage(named: "smile"), for: .normal)
            num += 1
            
        default:
            sender.setImage(UIImage(named: "pig"), for: .normal)
            num = 0
        }
        
        specialSound.playSound()
        
        UIView.transition(with: sender, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        UIView.transition(with: sender, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        UIView.transition(with: sender, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        UIView.transition(with: sender, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        
        return arc4random_uniform(UInt32(btnCoin.count - 1))
        
    }
    /*
    @IBAction func btnFlip(_ sender: Any) {
        if isOpen{
            isOpen = false
            btnCoin.setImage(UIImage(named: "coin1"), for: .normal)

            UIView.transition(with: btnCoin, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        }
        
        else {
            isOpen = true
            btnCoin.imageView?.image = UIImage(named: "coin2")
            UIView.transition(with: btnCoin, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        
    }
    */
    
    
    
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
