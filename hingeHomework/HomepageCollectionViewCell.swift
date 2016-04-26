//
//  HomepageCollectionViewCell.swift
//  hingeHomework
//
//  Created by Caponong, Lauren on 4/22/16.
//  Copyright © 2016 Caponong, Lauren. All rights reserved.
//

import UIKit

class HomepageCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var placeholderImageView: UIImageView!
    @IBOutlet weak var imageView: UIImageView!
    
    override func prepareForReuse() {
        self.imageView.image = nil
        super.prepareForReuse()
    }
    
}
