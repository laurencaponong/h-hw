//
//  AFWrapper.swift
//  hingeHomework
//
//  Created by Caponong, Lauren on 4/25/16.
//  Copyright © 2016 Caponong, Lauren. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class AFWrapper: NSObject {
    
    class func getJSONData() {
        
        Alamofire.request(.GET, "https://hinge-homework.s3.amazonaws.com/client/services/homework.json") .responseJSON {
            response in
            
            switch response.result {
                
                case .Success:
                    if let value = response.result.value as? Dictionary<String, AnyObject> {
                        closure(dict:json)
                }
                    
                case .Failure(let error):
                    print(error)
                }
        }
        
    }

    
}
