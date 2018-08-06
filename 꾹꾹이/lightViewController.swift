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
                self.newVc(viewController: "light2"),
                self.newVc(viewController: "light3")]
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
                               animated: true,
                               completion: nil)
        }
        
        
    }
    
    
    
}






class circleViewController: UIViewController {
    
    
    
    
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var btn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        img1.image = UIImage(named: "Image")!
        
    }
    
    @IBAction func btnClick(_ sender: UIButton) {
        
        img1.image = UIImage(named: "2")
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}


class cooViewController : UIViewController {
    
    
    @IBOutlet weak var hjk: UIImageView!
    @IBOutlet weak var btn2: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hjk.image = UIImage(named:"2")
        
    }
    
    
    @IBAction func btn2Click(_ sender: Any) {
        
        hjk.image = UIImage(named:"3")
    }
    
    
    override func didReceiveMemoryWarning() {
        
    }
    
    
}


class ciViewController: UIViewController {
    
    
    
    @IBOutlet weak var fg: UIImageView!
    @IBOutlet weak var btn3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fg.image = UIImage(named: "3")
        
    }
    
    
    @IBAction func btn3Click(_ sender: Any) {
        
        fg.image = UIImage(named: "Image")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}



