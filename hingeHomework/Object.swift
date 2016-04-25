//
//  Object.swift
//  hingeHomework
//
//  Created by Caponong, Lauren on 4/25/16.
//  Copyright © 2016 Caponong, Lauren. All rights reserved.
//

import UIKit

class Object {
    
    // MARK: Properties
    var name: String
    var description: String
    var image: UIImage?
    
    // MARK: Initialization
    init?(name: String, description: String, image: UIImage?) {
        self.name = name
        self.description = description
        self.image = image
        
        if name.isEmpty || description.isEmpty || image == nil {
            return nil
        }
        
    }
    
    
    class func objectsFromJSON(json: Dictionary<String, AnyObject>) -> [Object] {
        
    }
    
    
}