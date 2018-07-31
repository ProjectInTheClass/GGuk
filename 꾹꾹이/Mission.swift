//
//  Mission.swift
//  GGuk
//
//  Created by CAUAD23 on 2018. 7. 26..
//  Copyright © 2018년 CAUAD23. All rights reserved.
//

import Foundation

class Mission {

    var count:Int = 0
/*
    var ppokCount:Int
    var buttonCount:Int
    var switchCount:Int
    var toggleCount:Int
    var scrollCount:Int
    var dogCount:Int
    var pawCount:Int
    
    init(ppokCount:Int, buttonCount:Int, switchCount:Int, toggleCount:Int, scrollCount:Int, dogCount:Int, pawCount:Int) {
        self.ppokCount = ppokCount
        self.buttonCount = buttonCount
        self.switchCount = switchCount
        self.toggleCount = toggleCount
        self.scrollCount = scrollCount
        self.dogCount = dogCount
        self.pawCount = pawCount
    }
 */
    

}
class PpokMission: Mission {

    override var count: Int {
        get {
            return self.count
        }
        set{
            self.count = 0
        }
    }
}
class buttonMission: Mission {
    
    override var count: Int {
        get {
            return self.count
        }
        set{
            self.count = 0
        }
    }
}
class switchMission: Mission {
    
    override var count: Int {
        get {
            return self.count
        }
        set{
            self.count = 0
        }
    }
}
class toggleMission: Mission {
    
    override var count: Int {
        get {
            return self.count
        }
        set{
            self.count = 0
        }
    }
}
class scrollMission: Mission {
    
    override var count: Int {
        get {
            return self.count
        }
        set{
            self.count = 0
        }
    }
}
class dogMission: Mission {
    
    override var count: Int {
        get {
            return self.count
        }
        set{
            self.count = 0
        }
    }
}
class pawMission: Mission {
    
    override var count: Int {
        get {
            return self.count
        }
        set{
            self.count = 0
        }
    }
}
