//
//  LightViewController.swift
//  GGuk
//
//  Created by CAUAD22 on 2018. 8. 6..
//  Copyright © 2018년 CAUAD23. All rights reserved.
//

import UIKit

class LightViewController : UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    func newVc(viewController: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: viewController)
    }
    
    lazy var orderedViewControllers: [UIViewController] = {
        return [self.newVc(viewController: "light1"),
                self.newVc(viewController: "light2")]
    }()
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        // User is on the first view controller and swiped left to loop to
        // the last view controller.
        guard previousIndex >= 0 else {
            return orderedViewControllers.last
            // Uncommment the line below, remove the line above if you don't want the page control to loop.
            // return nil
        }
        
        guard orderedViewControllers.count > previousIndex else {
            return nil
        }
        
        return orderedViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = orderedViewControllers.count
        
        // User is on the last view controller and swiped right to loop to
        // the first view controller.
        guard orderedViewControllersCount != nextIndex else {
            return orderedViewControllers.first
            // Uncommment the line below, remove the line above if you don't want the page control to loop.
            // return nil
        }
        
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        
        return orderedViewControllers[nextIndex]
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        
        // This sets up the first view that will show up on our page control
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController],
                               direction: .forward,
                               animated: false,
                               completion: nil)
        }
        
    }
    
    
}



class circleViewController: UIViewController {

    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var btn1: UIButton!
    var click = false
    var switchSound = sound(soundName: "light")
    var counter = Counter()
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var countLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        img1.image = UIImage(named: "switch1")
        if let count = defaults.value(forKey: "lightCnt"){
            counter.count = count as! Int
        }
        counter.printCount(countLabel: countLabel)
    }
    
    
    @IBAction func btnClick(_ sender: UIButton) {
        if(click == false){
            img1.image = UIImage(named: "switch2")
            click = true
            switchSound.playSound()
        }
        else
        {
            img1.image = UIImage(named: "switch1")
            click = false
            switchSound.playSound()
            
            
            
        }
        counter.count += 1
        counter.printCount(countLabel: countLabel)
        defaults.set(counter.count, forKey: "lightCnt")
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
}


class cooViewController : UIViewController {
        
    @IBOutlet weak var catTail: UIImageView!
   
    @IBOutlet weak var img2: UIImageView!
    var down = false
    var catSound = sound(soundName: "cat")
    var counter = Counter()
    
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var catBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        catTail.image = UIImage(named: "cattail")
        img2.image = UIImage(named: "stand")
        if let count = defaults.value(forKey: "catCnt"){
            counter.count = count as! Int
        }
        counter.printCount(countLabel: countLabel)
        

    }
 

    @IBAction func catClick(_ sender: UIButton) {
        
        let x = catTail.frame.origin.x
        let y = catTail.frame.origin.y
        let tailPosition:CGPoint?
        if (down == false) {
            tailPosition = CGPoint(x: x, y: y + 140)
            UIView.animate(withDuration: 0.5, animations: {
                self.catTail.frame = CGRect(x: (tailPosition?.x)!, y: (tailPosition?.y)!, width: 60, height: 110)
            })
            down = true
            catSound.playSound()
            counter.count += 1
            counter.printCount(countLabel: countLabel)
            defaults.set(counter.count, forKey: "catCnt")
        }
        else {
            tailPosition = CGPoint(x: x, y: y - 140)
            UIView.animate(withDuration: 0.5, animations: {
                self.catTail.frame = CGRect(x: (tailPosition?.x)!, y: (tailPosition?.y)!, width: 60, height: 110)
            })
            down = false
            catSound.playSound()
            counter.count += 1
            counter.printCount(countLabel: countLabel)
            defaults.set(counter.count, forKey: "catCnt")
        }
    }
    
    
        
    override func didReceiveMemoryWarning() {
            
    }
    
}





