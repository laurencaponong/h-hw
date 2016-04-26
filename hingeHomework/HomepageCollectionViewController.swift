//
//  HomepageCollectionViewController.swift
//  hingeHomework
//
//  Created by Caponong, Lauren on 4/22/16.
//  Copyright © 2016 Caponong, Lauren. All rights reserved.
//

//Homepage View
    //Displays thumbnails of all the images downloaded from the API endpoint above.
    //A user can scroll through thumbnails of all the images.
    //Images should be displayed in the order indicated by the server.
    //Each image should be downloaded asynchronously and in a thread-safe manner.
    //Clicking on a thumbnail should open a Gallery View

//Additional Requirements
    //Testing is very important. Show us you know how to test the important pieces of your code.
    //The code should be clean and readable, and you should follow best practices for architecture, code formatting, variable/class names, etc.
    //Please include a README with any steps needed to start, and test your app.
    //Use comments where required.
    //You can assume we have:
        //XCode
        //Git
    //If there are any other required tools to run the project please specify or include a bundle.
    //The app should cache data for offline use.
    //The app should be attractive if initially started in offline mode.


import UIKit
import Kingfisher
import Alamofire
import SwiftyJSON

private let reuseIdentifier = "Cell"

class HomepageCollectionViewController: UICollectionViewController {
    
    var objects = [Object]()
    let cache = ImageCache(name: "cache")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView!.backgroundColor = UIColor.blackColor()
        
        AFWrapper.getJSONData { (arr) in
            self.objects = Object.objectsFromJSON(arr)
            self.collectionView?.reloadData()
        }
        
        prepareCache()
    }
    
    func prepareCache() {
        
        // Set max disk cache to 50 mb. Default is no limit.
        cache.maxDiskCacheSize = 10 * 1024 * 1024
        
        // Set max disk cache to duration to 3 days, Default is 1 week.
        cache.maxCachePeriodInSecond = 60 * 60 * 24 * 3
        
        // Get the disk size taken by the cache.
        cache.calculateDiskCacheSizeWithCompletionHandler { (size) -> () in
            print("disk size in bytes: \(size)")
        }
    }
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return objects.count
    }
    
    
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! HomepageCollectionViewCell
        
        cell.backgroundColor = UIColor.grayColor()
        
        let object = self.objects[indexPath.row]
        
        object.getImageForObject { (image) in
            if image != nil {
                cell.imageView.kf_setImageWithURL(NSURL(string: object.imageURL)!,
                    placeholderImage: nil,
                    optionsInfo: [.TargetCache(self.cache)])
            } else {
                print ("image not loaded")
            }
        }
        return cell

    }
    
    
    
    
    
    
    //        object.getImageForObject { (image) in
    //            if image != nil {
    //                cell.imageView?.image = image
    //                UIView.animateWithDuration(0.3) {
    //                    cell.imageView.alpha = 1
    //                }
    //            } else {
    //                print("image is nil")
    //            }
    //        }
    
    
    
    //        object.getImageForObject { (image) in
    //            if image != nil {
    //                cell.imageView?.kf_setImageWithURL(NSURL(string: object.imageURL)!,
    //                    placeholderImage:  nil,
    //                    optionsInfo: [.ForceRefresh])
    //            } else {
    //                print ("image not loaded")
    //            }
    //        }
    
    
    //        // Image loading.
    ////        cell.imageUrl = data.imageUrl // For recycled cells' late image loads.
    //        if let image = data.imageURL.cachedImage {
    //            // Cached: set immediately.
    //            cell.imageView.image = image
    //            cell.imageView.alpha = 1
    //        } else {
    //            // Not cached, so load then fade it in.
    //            cell.placeholderImageView.alpha = 0
    //            data.imageURL.fetchImage { image in
    //                // Check the cell hasn't recycled while loading.
    //                if cell.imageURL == data.imageURL {
    //                    cell.imageView.image = image
    //                    UIView.animateWithDuration(0.3) {
    //                        cell.imageView.alpha = 1
    //                    }
    //                }
    //            }
    //        }
    //
    //        
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource


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
    
    
    
    //    func getJSONData() {
    //
    //        Alamofire.request(.GET, "https://hinge-homework.s3.amazonaws.com/client/services/homework.json") .responseJSON {
    //            response in
    //
    //            switch response.result {
    //
    //                case .Success:
    //                    if let value = response.result.value {
    //                        let json = JSON(value)
    //
    //                        for i in 1...json.count {
    //                            let imageURL = json[i]["imageURL"].stringValue
    //                            self.imageURLarray.append(imageURL)
    //                        }
    //
    //                        print(self.imageURLarray)
    //
    //                    }
    //
    //                case .Failure(let error):
    //                    print(error)
    //                }
    //        }
    //
    //    }
    //
    //    func downloadImages () {
    //
    //        dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
    //
    //            self.myImage =  UIImage(data: NSData(contentsOfURL: NSURL(string:"https://www.google.com/logos/doodles/2016/earth-day-2016-5741289212477440.2-5643440998055936-ror.jpg")!)!)!
    //        })
    //
    //    }
    //
    //
    
    
    
    //    func downloadImages() {
    //
    //        Alamofire.request(.GET, "https://hinge-homework.s3.amazonaws.com/client/services/homework.json") .responseImage { response in debugPrint(response)
    //
    //            print(response.request)
    //            print(response.response)
    //            debugPrint(response.result)
    //
    //            if let image = response.result.value {
    //                print("image downloaded: \(image)")
    //            }
    //
    //        }
    //    }
    
    



    
    

}
