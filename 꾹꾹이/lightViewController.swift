
import UIKit

class LightViewController : UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    var pageControl = UIPageControl()
    func configurePageControl() {
        // The total number of pages that are available is based on how many available colors we have.
        pageControl = UIPageControl(frame: CGRect(x: 0,y: UIScreen.main.bounds.maxY - 50,width: UIScreen.main.bounds.width,height: 50))
        self.pageControl.numberOfPages = orderedViewControllers.count
        self.pageControl.currentPage = 0
        self.pageControl.tintColor = UIColor.black
        self.pageControl.pageIndicatorTintColor = UIColor.white
        self.pageControl.currentPageIndicatorTintColor = UIColor.black
        self.view.addSubview(pageControl)
    }
    
    @IBAction func replayBtn(_ sender: Any) {
       // self.currentPage.self.
    }
    
    
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
        self.delegate = self
        configurePageControl()
        self.dataSource = self
        
        // This sets up the first view that will show up on our page control
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController],
                               direction: .forward,
                               animated: false,
                               completion: nil)
        }
        
    }
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let pageContentViewController = pageViewController.viewControllers![0]
        self.pageControl.currentPage = orderedViewControllers.index(of: pageContentViewController)!
    }
}


//조명스위치
class circleViewController: UIViewController {

    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var btn1: UIButton!
    var click = false
    var switchSound = sound(soundName: "light")
    var counter = Counter()
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var countLabel: UILabel!
    
    @IBAction func replayBtn(_ sender: UIButton) {
        counter.count = 0
        defaults.set(counter.count, forKey: "lightCnt")
        counter.printCount(countLabel: countLabel)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        img1.image = UIImage(named: "switch1")
        self.view.backgroundColor = #colorLiteral(red: 0.7544217957, green: 0.7023390309, blue: 0.5660703121, alpha: 1)
        if let count = defaults.value(forKey: "lightCnt"){
            counter.count = count as! Int
        }
        counter.printCount(countLabel: countLabel)
    }
    
    
    @IBAction func btnClick(_ sender: UIButton) {
        if(click == false){
            self.view.backgroundColor = #colorLiteral(red: 1, green: 0.930963335, blue: 0.7503366357, alpha: 1)
            img1.image = UIImage(named: "switch2")
            click = true
            switchSound.playSound()
        }
        else
        {
            self.view.backgroundColor = #colorLiteral(red: 0.7544217957, green: 0.7023390309, blue: 0.5660703121, alpha: 1)
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

//빨리 눌렀을때 소리 어떡함..?
class cooViewController : UIViewController {
        
    @IBOutlet weak var catTail: UIImageView!
   
    @IBOutlet weak var img2: UIImageView!
    var down = false
    var catSound = sound(soundName: "cat")
    var angrySound  = sound(soundName: "angrycat")
    
    var counter = Counter()
    
    let defaults = UserDefaults.standard
    //cat tail 좌표
    var x:CGFloat?
    var y:CGFloat?
    
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var catBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        catTail.image = UIImage(named: "cattail")
        x = catTail.center.x
        y = catTail.center.y
        
        img2.image = UIImage(named: "stand")
        if let count = defaults.value(forKey: "catCnt"){
            counter.count = count as! Int
        }
        counter.printCount(countLabel: countLabel)
    }
    
    func printCatPaw() {
        let catPaw = UIImageView(frame: CGRect(x: 35, y: 250, width: 350, height: 550))
        catPaw.image = UIImage(named:"ppaw")
        catPaw.alpha = 1
        self.view.addSubview(catPaw)
        //발자국 나왔다가 들어가기
        UIView.animateKeyframes(withDuration: 3, delay: 0, options: .calculationModeCubic, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.35) {
                catPaw.center = CGPoint(x: self.view.bounds.midX, y: self.view.bounds.maxY + 250)
            }
        }, completion: nil)
        
        catSound.player?.stop()
        angrySound.playSound()

    }
    @IBAction func replayBtn(_ sender: UIButton) {
        counter.count = 0
        defaults.set(counter.count, forKey: "catCnt")
        counter.printCount(countLabel: countLabel)
    }

    @IBAction func catClick(_ sender: UIButton) {
        
        //self.catTail.center = CGPoint(x: self.x!, y: self.y!)
        

        if (down == false) {
            
            
            UIView.animate(withDuration: 0.5, animations: {
                self.catTail.transform = CGAffineTransform(translationX: 0, y: 100)
            })

            down = true
            catSound.playSound()
            counter.count += 1
            counter.printCount(countLabel: countLabel)
            defaults.set(counter.count, forKey: "catCnt")
            
        }
        else {
            UIView.animate(withDuration: 0.5, animations: {
                self.catTail.transform = CGAffineTransform.identity

            })

            down = false
            catSound.playSound()
            counter.count += 1
            counter.printCount(countLabel: countLabel)
            defaults.set(counter.count, forKey: "catCnt")
            
        }
        
        if(counter.showAction() == true){
            printCatPaw()
        }
    }
    
    
        
    override func didReceiveMemoryWarning() {
            
    }
    
}





