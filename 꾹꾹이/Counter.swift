//
//  Counter.swift
//  GGuk
//
//  Created by CAUAD22 on 2018. 8. 6..
//  Copyright © 2018년 CAUAD23. All rights reserved.
//

import Foundation
import UIKit

//파일에 저장하는 것도 해야됨

class Counter {
    let defaults = UserDefaults.standard
    var count:Int = 0

    func printCount(countLabel:UILabel){

        countLabel.font = UIFont(name: "Silkscreen-Expanded", size: 40)
        countLabel.text = "\(count)"
    }
    
    func showAction() -> Bool{
        if(count % 10 == 0){
            return true
        }
        else{
            return false
        }
    }
}
