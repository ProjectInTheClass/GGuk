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
    
    var count:Int = 0
    
    func showAlertMsg(title: String, message: String) {
        
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
        
        self.present(self.alertController!, animated: true, completion: nil)
        
    }
    
    func alertMessage() -> String {
        var message=""
        if let baseMessage=self.baseMessage {
            message=baseMessage+" "
        }
        return(message)
    }
    
    func printMessage(){
        
    switch count {
    case 10:
    self.showAlertMsg(title: "따단", message: "ㅎㅇ")
    case 50:
    self.showAlertMsg(title: "따단", message: "ㅅㄱ")
    case 100:
    self.showAlertMsg(title: "따단", message: "대단")
    case 200:
    self.showAlertMsg(title: "따단", message: "ㅇ")
    
    
    default:
    print("")
    }
    }
    
    
    
}
