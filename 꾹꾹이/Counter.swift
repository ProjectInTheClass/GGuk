//
//  Counter.swift
//  GGuk
//
//  Created by CAUAD23 on 2018. 8. 6..
//  Copyright © 2018년 CAUAD23. All rights reserved.
//

import Foundation
import UIKit

class Counter{
    var myLabel:UILabel
    var count:Int = 0
    init(label:UILabel) {
        self.myLabel = label
    }
    
    func printCount(){
        myLabel.text = "\(count)"
    }
}
