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
import Foundation
import Kingfisher

protocol deleteImageProtocol {
    func deleteImageAtIndex(imageIndex: Int)
}

class GalleryViewController: UIViewController {
    
    var selectedObject = hingeImage(name: "", description: "", imageURL: "")
    var selectedImageIndex: Int = 0
    var downloadedImages = [UIImage]()
    var objectsArray = [hingeImage]()
    var delegate: deleteImageProtocol?
    var animation: CAKeyframeAnimation?
    @IBOutlet weak var navbarTitle: UINavigationItem!
    @IBOutlet weak var galleryImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavbar()
        setInitialImage()
    }
    

    func setInitialImage() {
        let URL = NSURL(string: (objectsArray[selectedImageIndex].imageURL))
        galleryImageView.kf_setImageWithURL(URL!)
    }
    
    
    //MARK: - Button tap methods
    @IBAction func backButtonTapped(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
        galleryImageView.stopAnimating()
    }
    
    @IBAction func deleteButtonTapped(sender: AnyObject) {
        delegate?.deleteImageAtIndex(selectedImageIndex)
        dismissViewControllerAnimated(true, completion: nil)
        galleryImageView.stopAnimating()
    }
    
    
    
    //MARK: - User interface methods
    func changeNavbarTitleNumbers(indexOfCurrentImage: Int) {
        self.navbarTitle.title = "\((selectedImageIndex + 1)) / \((objectsArray.count + 1))"
    }
    
    func setupNavbar() {
        self.navbarTitle.title = "\((selectedImageIndex + 1)) / \((objectsArray.count + 1))"
    }


}
