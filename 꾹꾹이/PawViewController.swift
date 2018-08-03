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


    var imageView = UIImageView()
    var pawImage:UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setImageView()
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
    
    @IBAction func myActionMethod(_ gestureRecognizer: UIGestureRecognizer){
        guard gestureRecognizer.view != nil else { return }
        
        
        if gestureRecognizer.state == .ended {
            
            self.view.addSubview(imageView)
            // Move the view down and to the right when tapped.
            /*
            let animator = UIViewPropertyAnimator(duration: 0.2, curve: .easeInOut, animations: {
                gestureRecognizer.view!.center.x += 100
                gestureRecognizer.view!.center.y += 100
            })
            animator.startAnimation()
            */
            
            
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
