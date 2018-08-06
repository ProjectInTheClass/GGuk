//
//  sound.swift
//  GGuk
//
//  Created by CAUAD22 on 2018. 8. 6..
//  Copyright © 2018년 CAUAD23. All rights reserved.
//

import Foundation
import AVFoundation

class sound {
    
    
    var player : AVAudioPlayer?
    var soundName:String
    
    init(soundName:String) {
        self.soundName = soundName
    }
    
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: soundName, withExtension: "m4a")
            else {
                print("url not found")
                return
        }
        
        do
            
        {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3)
            player!.play()
            
        } catch let error as NSError {
            print("error: \(error.localizedDescription)")
            
        }
    }

    
    
    
}
