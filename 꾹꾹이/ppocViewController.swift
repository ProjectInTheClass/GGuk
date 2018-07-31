//
//  ppocViewController.swift
//  GGuk
//
//  Created by CAUAD23 on 2018. 7. 31..
//  Copyright © 2018년 CAUAD23. All rights reserved.
//

import UIKit

class Bubble {
    var bubble:UIButton
    //var bubbleImage:UIImage = UIImage(named: "ppoc")!
    var isClicked = false
    
    init(bubble:UIButton) {
        self.bubble = bubble
        setBubbleImage()
    }
    func setBubbleImage(){
        bubble.imageView?.image = UIImage(named: "ppoc")
    }
    
    func whenTouchBubble() {
        if(isClicked == false){
            bubble.imageView?.image = UIImage(named: "pooc2")
        }
    }
}


class ppocViewController: UIViewController {
    
    //뽁뽁이를 눌렀을때
    @IBAction func clickBubble(_ sender: UIButton) {
        sender.setImage(UIImage(named: "ppoc4"), for: .normal)
        sender.isEnabled = false
    }
    
    //리플레이를 눌렀을때
    @IBAction func clickReplay(_ sender: UIBarButtonItem) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
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
