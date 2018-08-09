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
    var front: [Bool] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counter.printCount(countLabel: countLabel)
        // Do any additional setup after loading the view.
        for i in 0...btnCoin.count - 1 {
            btnCoin[i].setImage(UIImage(named: "coin1"), for: .normal)
            front.append(false)
        }
      
    }

    @IBAction func btnFlip(_ sender: UIButton) {
        if front[sender.tag] {
            front[sender.tag] = false
            sender.setImage(UIImage(named: "coin1"), for: .normal)
            coinSound.playSound()
            counter.count += 1
            UIView.transition(with: sender, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
            counter.printCount(countLabel: countLabel)
        }
            
        else {
            front[sender.tag] = true
            sender.setImage(UIImage(named: "coin2"), for: .normal)
            UIView.transition(with: sender, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
            coinSound.playSound()
            counter.count += 1
            counter.printCount(countLabel: countLabel)
        
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
