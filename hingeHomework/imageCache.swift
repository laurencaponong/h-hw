//
//  imageCache.swift
//  hingeHomework
//
//  Created by Caponong, Lauren on 4/27/16.
//  Copyright © 2016 Caponong, Lauren. All rights reserved.
//

import Foundation
import Kingfisher

class imageCache {
    
    let downloader = KingfisherManager.sharedManager.downloader
    
    let myCache = ImageCache(name: "my_cache")
    var downloadedImages = [UIImage]()
    
}