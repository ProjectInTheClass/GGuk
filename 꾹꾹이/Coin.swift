//
//  Coin.swift
//  GGuk
//
//  Created by CAUAD22 on 2018. 8. 8..
//  Copyright © 2018년 CAUAD23. All rights reserved.
//

import UIKit

class Coin: UIViewController {
    
    
    @IBOutlet weak var btnCoin: UIButton!

    var isOpen = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func btnFlip(_ sender: Any) {
        if isOpen{
            isOpen = false
            btnCoin.imageView?.image = UIImage(named: "coin1")

            UIView.transition(with: btnCoin, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        }
        
        else {
            isOpen = true
            btnCoin.imageView?.image = UIImage(named: "coin2")
            UIView.transition(with: btnCoin, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        
    }
    
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
