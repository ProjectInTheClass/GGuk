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
        //countLabel.font = UIFont.systemFont(ofSize: 25)
        countLabel.font = UIFont.boldSystemFont(ofSize: 25)
        //countLabel.font = UIFont.italicSystemFont(ofSize: 20.0)
        countLabel.text = "\(count)"
    }
}
