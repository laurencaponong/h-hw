//
//  HomepageCollectionViewController.swift
//  hingeHomework
//
//  Created by Caponong, Lauren on 4/22/16.
//  Copyright © 2016 Caponong, Lauren. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

private let reuseIdentifier = "Cell"

class HomepageCollectionViewController: UICollectionViewController {
    
    var items = ["1", "2", "3", "4", "5", "6", "7", "8", "kitten", "puppy", "bird"]
    var imageURLarray = [String]()
    var images = [String]()
    var myImage = UIImage()
    var dictionary = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getJSONData()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        self.collectionView!.registerClass(HomepageCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView!.backgroundColor = UIColor.grayColor()

        // Do any additional setup after loading the view.

    }
    
    
    func getJSONData() {
        
        Alamofire.request(.GET, "https://hinge-homework.s3.amazonaws.com/client/services/homework.json") .responseJSON {
            response in
            
            switch response.result {
                
                case .Success:
                    if let value = response.result.value {
                        let json = JSON(value)
                        
                        for i in 1...json.count {
                            let imageURL = json[i]["imageURL"].stringValue
                            self.imageURLarray.append(imageURL)
                        }
                        
                        print(self.imageURLarray)
                        
                    }
        
                case .Failure(let error):
                    print(error)
                }
        }
        
    }
    
    func loadImages () {
        
        dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            
            self.myImage =  UIImage(data: NSData(contentsOfURL: NSURL(string:"https://www.google.com/logos/doodles/2016/earth-day-2016-5741289212477440.2-5643440998055936-ror.jpg")!)!)!
        })
        
    }


    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
   
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! HomepageCollectionViewCell
//    
//        cell.nameLabel?.text = self.items[indexPath.row]
//        cell.imageView?.image = self.imageArray[indexPath.row]
        
        cell.backgroundColor = UIColor.blueColor()
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}
