//
//  GalleryViewController.swift
//  hingeHomework
//
//  Created by Caponong, Lauren on 4/25/16.
//  Copyright © 2016 Caponong, Lauren. All rights reserved.
//

//Gallery View (Consists of 2 sections)
    //Image View
    //Should display a single image to fit the area.
    //Will initially display the image that was clicked on in the previous step.
    //Every two seconds the view should progress to the next image in the list.
    //After the last image is displayed, starting over with the first image in the list.
//Navigation Bar
    //Back arrow button to return back to the Homepage.
    //Displays image’s position in the list (i.e., “5/16”).
    //Includes a button that removes an image from the list.

import UIKit
import Kingfisher

protocol deleteImageProtocol {
    func deleteImageAtIndex(imageIndex: Int)
}

class GalleryViewController: UIViewController {
    
    var object = Object(name: "", description: "", imageURL: "")
    var imageIndex: Int = 0
    var downloadedImagesArray = [UIImage]()
    var currentArraySize: Int = 0
    var objectsArray = [Object]()
    let animationDuration: NSTimeInterval = 0.25
    let switchingInterval: NSTimeInterval = 3
    var delegate: deleteImageProtocol?
    @IBOutlet weak var navbarTitle: UINavigationItem!
    @IBOutlet weak var galleryImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navbarTitle.title = "\((imageIndex + 1)) / \((currentArraySize + 1))"
        setAndAnimateImages()
    }
    
    //MARK: - Button tap methods
    @IBAction func backButtonTapped(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func deleteButtonTapped(sender: AnyObject) {
        delegate?.deleteImageAtIndex(imageIndex)
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func setAndAnimateImages() {
        
        for eachObject in objectsArray {
            let imageURL = NSURL(string: eachObject.imageURL)
            print(imageURL)
            galleryImageView.kf_setImageWithURL(imageURL!)
            galleryImageView.animationDuration = 3.0
            galleryImageView.startAnimating()
        }
        
//        for object in 0..<objectsArray.count {
//            let imageURL = NSURL(string: objectsArray[object].imageURL)
//            galleryImageView.kf_setImageWithURL(imageURL!)
//            galleryImageView.animationDuration = 3.0
//            galleryImageView.startAnimating()
//        }
        
//        for object in 0..<objectsArray.count {
//            let URLstring = objectsArray[object].imageURL
//            galleryImageView.kf_setImageWithURL(NSURL(string: URLstring)!,
//                                                placeholderImage: nil,
//                                                optionsInfo: [.Transition(ImageTransition.Fade(1))])
//        }
//        
        
//        //add images to the array
//        var imagesListArray :NSMutableArray = []
//        
//        //use for loop
//        for position in 1...5
//        {
//            var strImageName : String = "c\(position).png"
//            var image  = UIImage(named:strImageName)
//            imagesListArray.addObject(image!)
//        }
//        
//        self.galleryImageView.animationImages = imagesListArray;
//        self.galleryImageView.animationDuration = 1.0
//        self.galleryImageView.startAnimating()
//        
        
    }
    
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        
    }

}
