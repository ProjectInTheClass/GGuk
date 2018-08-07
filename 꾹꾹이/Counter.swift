//
//  Counter.swift
//  GGuk
//
//  Created by CAUAD22 on 2018. 8. 6..
//  Copyright © 2018년 CAUAD23. All rights reserved.
//

import Foundation
import UIKit

class Counter {
    var count:Int = 0
    var countLabel:UILabel
    init(label:UILabel) {
        self.countLabel = label
    }
    func printCount(){
        countLabel.text = "\(count)"
    }
}
