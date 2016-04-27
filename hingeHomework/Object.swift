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

    //asynchronously download image
    func getImageForObject(completion: (image: UIImage?) -> Void) {
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0)) {
            
            let URL = NSURL(string: self.imageURL)
            var data = NSData(contentsOfURL: URL!)
            
            if data != nil {
                let objectImage = UIImage(data: data!)
//                print("\n loaded image: \(URL)")
                dispatch_sync(dispatch_get_main_queue(), { () -> Void in
                    completion(image: objectImage)
                })
            }
            
            if data == nil {
                print("image not loaded \n")
            }
        }
    }
}
    

    
//        //result = the json array
//        if let result = json as? Array {
//            
//            print(result)
//            
//            //objects from results is json[0]
//            if let objectsFromResults = json[0] as? AnyObject {
//                
//                //look into objects from results
//                for i in 0..<objectsFromResults.count {
//                    if let dict = objectsFromResults[i] as? Dictionary<String, AnyObject> {
//                            let imageName = dict["imageName"] as! String
//                            let imageURL = dict["imageURL"] as! String
//                            let imageDescription = dict["imageDescription"] as! String
//                            objects.append(Object.init(name: imageName, description: imageDescription, imageURL: imageURL)!)
//                            print("\(imageName) \n, \(imageDescription) \n, \(imageURL) \n")
//                        }
//                }
//            }
//        }
//        return objects
//    }
//    
    
//    //grab objects from JSON
//    class func objectsFromJSON(json: Dictionary<String, AnyObject>) -> [Object] {
//        
//        //create array of objects
//        var objects = [Object]()
//        
//        if let result = json as? Dictionary<String, AnyObject> {
//            if let objectsFromResults = result[""] as? [AnyObject] {
//                for i in 0..<objects.count {
//                    if let dict = objectsFromResults[i] as? Dictionary<String, AnyObject> {
//                        let imageName = dict["imageName"] as! String
//                        let imageURL = dict["imageURL"] as! String
//                        let imageDescription = dict["imageDescription"] as! String
//                        objects.append(Object.init(name: imageName, description: imageDescription, imageURL: imageURL)!)
//                    }
//                }
//            }
//        }
//    
//    return objects
//    
//    }
    
    
    
    //        if let result = json as? Array {
    //            if let objectsFromResults = json[0] as? AnyObject {
    //                for i in 0..<objects.count {
    //                    if let dict = objectsFromResults[i] as? Dictionary<String, AnyObject> {
    //                        let imageName = dict["imageName"] as! String
    //                        let imageURL = dict["imageURL"] as! String
    //                        let imageDescription = dict["imageDescription"] as! String
    //                        print("\(imageName), \(imageDescription), \(imageURL)")
    //                        objects.append(Object.init(name: imageName, description: imageDescription, imageURL: imageURL)!)
    //                    }
    //                }
    //            }
    //        }
    
    
    
    //look into objects from results
    //                for i in 0..<objectsFromResults.count {
    //                    print("objects from results count: \n \(objectsFromResults.count)")
    //                    if let dict = objectsFromResults[i] as? Dictionary<String, AnyObject> {
    //                        let imageName = dict["imageName"] as! String
    //                        let imageURL = dict["imageURL"] as! String
    //                        let imageDescription = dict["imageDescription"] as! String
    //                        objects.append(Object.init(name: imageName, description: imageDescription, imageURL: imageURL)!)
    //                        print("\(imageName) \n, \(imageDescription) \n, \(imageURL) \n")
    //                    }
    //                }
    
    
    