//
//  CollectionViewCell.swift
//  GGuk
//
//  Created by CAUAD23 on 2018. 8. 2..
//  Copyright © 2018년 CAUAD23. All rights reserved.
//

import UIKit


class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var myImage: UIImageView!
    var count:Int = 0
    var ppocSound = sound(soundName: "bubble")
    
    
    override var isSelected: Bool{
        didSet{
            if self.isSelected{
                self.myImage.image = UIImage(named: "ppoc4")
                count += 1
                ppocSound.playSound()
            }
        }
    }

    
}
