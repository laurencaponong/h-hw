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
    var description: String? = nil
    var imageURL: String
    
    // MARK: Initialization
    init?(name: String, description: String?, imageURL: String) {
        self.name = name
        self.description = description
        self.imageURL = imageURL
    }
    
    //grab objects from JSON
    class func objectsFromJSON(json: [Dictionary<String,String>]) -> [Object] {
        
        //create array of objects
        var objects = [Object]()
        
        //result = the json array
            if let objectsFromResults = json as? AnyObject {
                for i in 0..<objectsFromResults.count {
                    if let dict = objectsFromResults[i] as? Dictionary<String, AnyObject> {
                        let imageName = dict["imageName"] as! String
                        let imageURL = dict["imageURL"] as! String
                        let imageDescription = dict["imageDescription"] as! String
                        objects.append(Object.init(name: imageName, description:imageDescription, imageURL: imageURL)!)
//                        print("\(imageName) \n, \(imageDescription) \n, \(imageURL) \n \n")
                    }
                }
            }
        
        return objects
    }

}
    