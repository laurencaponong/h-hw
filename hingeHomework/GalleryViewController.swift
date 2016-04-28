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
    
    var currentObject = Object(name: "", description: "", imageURL: "")
    var downloadedImages = [UIImage]()
    var imageIndex: Int = 0
    var objectsArray = [Object]()
    var delegate: deleteImageProtocol?
    @IBOutlet weak var navbarTitle: UINavigationItem!
    @IBOutlet weak var galleryImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navbarTitle.title = "\((imageIndex + 1)) / \((objectsArray.count + 1))"
//        animateImages()
    }
    
    func animateImages() {
        galleryImageView.animationImages = downloadedImages
        galleryImageView.animationDuration = 10.0
        galleryImageView.startAnimating()
    }
    
    //MARK: - Button tap methods
    @IBAction func backButtonTapped(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func deleteButtonTapped(sender: AnyObject) {
        delegate?.deleteImageAtIndex(imageIndex)
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        
    }

}
