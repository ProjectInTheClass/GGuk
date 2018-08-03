//
//  PawViewController.swift
//  GGuk
//
//  Created by CAUAD23 on 2018. 8. 2..
//  Copyright © 2018년 CAUAD23. All rights reserved.
//

import UIKit
class View:UIView{
    
}
class PawViewController: UIViewController {


    @IBOutlet weak var imageView: UIImageView!
    //var imageView: UIImageView!
    let pawImage = UIImage(named: "paw")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setImageView()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        self.imageView.isUserInteractionEnabled = true
        self.imageView.addGestureRecognizer(tapGestureRecognizer)
        
    }
    func tapAction(sender: UITapGestureRecognizer){
        let touchPoint = sender.location(in: self.imageView)
        print(touchPoint)
        /*
        let z1 = touchPoint.x * (imageView.image?.size.width)! / imageView.frame.width
        let z2 = touchPoint.y * (imageView.image?.size.height)!/imageView.frame.height
        */
        let pin = UIImageView(frame: CGRect(x: touchPoint.x - 20, y: touchPoint.y - 20, width: 40, height: 40))
        pin.image = UIImage(named: "ppoc")
        imageView.addSubview(pin)
    }
    /*
    func fadeImage(){
        //let pawImage = UIImage(named: "paw")
        UIView.transition(with: self.imageView!, duration: 5, options: .transitionCrossDissolve, animations: {self.imageView?.image = pawImage}, completion: nil)
    }
*/

    func setImageView(){
        imageView.frame.size.width = 50
        imageView.frame.size.height = 50
        imageView.frame.origin.y = 0
        imageView.image = pawImage
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        let touch: UITouch = touches.first!
        
        touch.view?.addSubview(imageView)
    
        //터치 좌표
    
    }
    
    
    @IBAction func myActionMethod(_ gestureRecognizer: UIGestureRecognizer){
        guard gestureRecognizer.view != nil else { return }
        
        if gestureRecognizer.state == .ended {
            
           // self.view.addSubview(imageView)
            // Move the view down and to the right when tapped.
            
            let animator = UIViewPropertyAnimator(duration: 0, curve: .easeInOut, animations: {
                
                gestureRecognizer.view?.addSubview(self.imageView)
               // gestureRecognizer.view!.center.x += 100
               // gestureRecognizer.view!.center.y += 100
            })
            animator.startAnimation()
            
            
            
        }
    }
    
    func handleTapGesture(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            
        }
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
