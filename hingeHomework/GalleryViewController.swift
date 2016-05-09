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

import Kingfisher

protocol deleteImageProtocol {
    func deleteImageAtIndex(imageIndex: Int)
}

class GalleryViewController: UIViewController {
    
    var selectedImage = hingeImage(name: "", description: "", imageURL: "")
    var index: Int = 0
    var timer = NSTimer()
    var images = [hingeImage]()
    var delegate: deleteImageProtocol?
    @IBOutlet weak var galleryImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setInitialImage()
        self.view.backgroundColor = UIColor.blackColor()
        self.navigationItem.title = " \(index + 1) / \(images.count + 1)"
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        fadeImageInOut()
        timer = NSTimer.scheduledTimerWithTimeInterval(2,  target: self, selector: #selector(fadeImageInOut), userInfo: nil, repeats: true)
    }
    
    
    //MARK: - Setting and transitioning images
    func setInitialImage() {
        let URL = NSURL(string: (images[index].imageURL))
        galleryImageView.kf_setImageWithURL(URL!)
    }
    
    func setNextImage() -> hingeImage {
        index += 1

        //if index is larger than the amount of current images, start over
        if index >= images.count { index = 0 }
        
        self.navigationItem.title = " \(index + 1) / \(images.count + 1)"
        return images[index]
    }
    
    func fadeImageInOut() {
        let opacity = galleryImageView.alpha == 0
        UIView.animateWithDuration(0.4, animations: {
            self.galleryImageView.alpha = CGFloat(opacity)
        }) { (done) in
            if !opacity {
                let URL = NSURL(string: self.setNextImage().imageURL)
                self.galleryImageView.kf_setImageWithURL((URL)!)
                self.fadeImageInOut()
            }
        }
    }
    
    
    //MARK: - Navigation bar button tap methods
    @IBAction func backButtonTapped(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
        timer.invalidate()
    }
    
    @IBAction func deleteButtonTapped(sender: AnyObject) {
        delegate?.deleteImageAtIndex(index)
        navigationController?.popViewControllerAnimated(true)
        timer.invalidate()
    }

}
