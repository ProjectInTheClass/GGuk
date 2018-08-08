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
    let pawImage = UIImage(named: "pawe")
    var snowSound:sound?

    var counter = Counter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counter.printCount(countLabel: countLabel)
    }
    
    func setImageView(x:CGFloat, y:CGFloat){
        let imageView = UIImageView()
        //화면 클릭한곳의 가운데 위치하도록
        imageView.frame = CGRect(x: x - 20, y: y - 15, width: 40, height: 30)
        imageView.image = pawImage
        
        self.view.addSubview(imageView)
        counter.count += 1

        switch (counter.count)%4 {
        case 0:
            snowSound = sound(soundName: "snow")
        case 1:
            snowSound = sound(soundName: "snow2")
        case 2:
            snowSound = sound(soundName: "snow3")
        default:
            snowSound = sound(soundName: "snow4")
        }
        
        snowSound!.playSound()
        
        counter.printCount(countLabel: countLabel)
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
