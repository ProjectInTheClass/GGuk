import Foundation
import UIKit
//네비게이션 바를 투명하게
@IBDesignable
public class TransparentNavigationController:UINavigationController
{
    
    public override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.isTranslucent = true
        self.view.backgroundColor = UIColor.clear

    }
}
