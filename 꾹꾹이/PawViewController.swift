//
//  PawViewController.swift
//  GGuk
//
//  Created by CAUAD23 on 2018. 8. 2..
//  Copyright © 2018년 CAUAD23. All rights reserved.
//


import UIKit

class PawViewController: UIViewController {
    
    @IBOutlet weak var countLabel: UILabel!
    var count = 0
    let pawImage = UIImage(named: "paw")
    var snowSound = sound(soundName: "snow")
    
    func printCount(){
        countLabel.text = "\(count)"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        printCount()
    }
    
    func setImageView(x:CGFloat, y:CGFloat){
        let imageView = UIImageView()
        //화면 클릭한곳의 가운데 위치하도록
        imageView.frame = CGRect(x: x - 20, y: y - 15, width: 40, height: 30)
        imageView.image = pawImage
        
        self.view.addSubview(imageView)
        snowSound.playSound()
        count += 1
        printCount()
        //alpht = 밝기 -> 1에서 0으로 가면서 fade out
        imageView.alpha = 1
        UIView.animate(withDuration: 5, animations: {
            imageView.alpha = 0
        })
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        let touch: UITouch = touches.first!
        let startPoint:CGPoint = touch.location(in: self.view)
        let touchX = startPoint.x
        let touchY = startPoint.y
        
        //터치 좌표를 가지고 넣어준다.
        setImageView(x: touchX, y: touchY)
    }
    
}
