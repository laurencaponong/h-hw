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


import Kingfisher
import Alamofire
import SwiftyJSON

private let reuseIdentifier = "Cell"

class HomepageCollectionViewController: UICollectionViewController, deleteImageProtocol {
    
    var hingeImages = [hingeImage]()
    var imageArray = [UIImage]()
    var myCache = ImageCache(name: "myCache")
    let downloader = KingfisherManager.sharedManager.downloader
    let downloadedImages = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView!.backgroundColor = UIColor.blackColor()
        
        AFWrapper.getJSONData { (arr) in
            self.hingeImages = hingeImage.objectsFromJSON(arr)
            self.collectionView?.reloadData()
        }
    }

    // MARK: - User interface styles
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    func deleteImageAtIndex(imageIndex: Int) {
        self.hingeImages.removeAtIndex(imageIndex)
        self.collectionView?.reloadData()
    }
    
    
    // MARK: - Table view methods
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hingeImages.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! HomepageCollectionViewCell
        cell.backgroundColor = UIColor.blackColor()
        let object = self.hingeImages[indexPath.row]
        
        //Set image of cell
        cell.imageView?.kf_setImageWithURL(NSURL(string: object.imageURL)!,
                                           placeholderImage: nil,
                                           optionsInfo: [.TargetCache(myCache)])
        
        downloader.downloadImageWithURL(NSURL(string: object.imageURL)!, progressBlock: { (receivedSize, totalSize) in }) { (image, error, imageURL, originalData) in
                if image != nil {
                    self.imageArray.append(image!)
                }
            }
        
        return cell
    }
    
    
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showGalleryView" {
            
            if let indexPath = self.collectionView?.indexPathForCell(sender as! UICollectionViewCell) {
                
                    let galleryDetailVC = segue.destinationViewController as! GalleryViewController
                    galleryDetailVC.delegate = self
                
                    //passing data over
                    galleryDetailVC.currentImageIndex = indexPath.row
                    galleryDetailVC.objectsArray = hingeImages
                    galleryDetailVC.currentObject = hingeImages[indexPath.row]
                    galleryDetailVC.downloadedImages = imageArray
                
                    let object = self.hingeImages[indexPath.row]
                
                    galleryDetailVC.galleryImageView?.kf_setImageWithURL(NSURL(string: object.imageURL)!)
            
            }
        }
    }
    }


