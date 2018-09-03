//
//  Main.swift
//  GGuk
//
//  Created by CAUAD22 on 2018. 8. 13..
//  Copyright © 2018년 CAUAD23. All rights reserved.
//

import UIKit

class Main: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var paw1: UIImageView!
    @IBOutlet weak var paw2: UIImageView!
    
    @IBOutlet weak var pawBtn1: UIButton!
    @IBOutlet weak var pawBtn2: UIButton!
    var left = false
    var right = false
    
    @IBAction func pawClick1(_ sender: UIButton) {
        if(left == false) {
            paw1.image = UIImage(named : "heartPaw")
            left = true
        }
        else {
            paw1.image = UIImage(named: "pink")
            left = false
        }
    }
    
    @IBAction func pawClick2(_ sender: UIButton) {
        if(right == false) {
            paw2.image = UIImage(named: "heartPaw")
            right = true
        }
        else {
            paw2.image = UIImage(named: "pink")
            right = false
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
