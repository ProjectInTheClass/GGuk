//
//  PpocCollectionViewController.swift
//  GGuk
//
//  Created by CAUAD23 on 2018. 8. 2..
//  Copyright © 2018년 CAUAD23. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class PpocCollectionViewController: UICollectionViewController {

    var bubbleImages = [String]()
    let imagePicker = UIImagePickerController()
    override func viewDidLoad(){
        super.viewDidLoad()
        initBubbleImage()
        /*
        collectionView?.dataSource = self
        collectionView?.delegate = self
        collectionView?.register(UINib.init(nibName: "Cell", bundle: nil), forCellWithReuseIdentifier: "Cell")
 */
        
       // collectionView?.allowsMultipleSelection = true
    //collectionView?.isDragging
        
}
    
    
    @IBAction func clickReplay(_ sender: UIBarButtonItem) {

    }
    func initBubbleImage(){
        for _ in 0...69 {
            bubbleImages.append("ppoc")
        }
    }
  
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //다시 누르면

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    //섹션 개수
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return bubbleImages.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell  {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
    
        // Configure the cell
        let image = UIImage(named: bubbleImages[indexPath.row])
        cell.myImage.image = image
        
        return cell
    }
    
    func initCollectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
        let image = UIImage(named: bubbleImages[indexPath.row])
        cell.myImage.image = image
        
        return cell
    }

    // MARK: UICollectionViewDelegate

    override func collectionView(_ collectionView:UICollectionView, didSelectItemAt indexPath: IndexPath){
        //_selectedCells.add(indexPath)
        collectionView.reloadItems(at: [indexPath])
    }
    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
