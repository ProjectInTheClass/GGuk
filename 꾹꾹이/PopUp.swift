//
//  PopUp.swift
//  GGuk
//
//  Created by CAUAD22 on 2018. 8. 6..
//  Copyright © 2018년 CAUAD23. All rights reserved.
//

import Foundation
import UIKit


class PopUp : UIViewController {
    
    var alertController: UIAlertController?
    var baseMessage: String?
    
    func showAlertMsg(title: String, message: String){
        
        
        guard (self.alertController == nil) else {
            print("Alert already displayed")
            return
        }
        
        
        self.baseMessage = message
        //self.remainingTime = time
        
        self.alertController = UIAlertController(title: title, message: self.alertMessage(), preferredStyle: .alert)
        
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            print("Alert was cancelled")
            self.alertController=nil;
            //self.alertTimer?.invalidate()
            // self.alertTimer=nil
        }
        
        self.alertController!.addAction(cancelAction)
        
        //self.alertTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.countDown), userInfo: nil, repeats: true)
        
        // return self.alertController!
    }
    
    
    
    func alertMessage() -> String {
        var message=""
        if let baseMessage=self.baseMessage {
            message=baseMessage+" "
        }
        return(message)
    }
    
    func printMessage(count:Int) -> UIAlertController? {
        
        switch count {
        case 10:
            self.showAlertMsg(title: "따단", message: "출발이 좋네요~^^")
        case 50:
            self.showAlertMsg(title: "따단", message: "화이팅")
        case 100:
            self.showAlertMsg(title: "따단", message: "오예")
        case 200:
            self.showAlertMsg(title: "따단", message: "감사합니다")
        default:
            break
            
        }
        
        return alertController
    }
    
    //func printMessage
    
    
    
}
