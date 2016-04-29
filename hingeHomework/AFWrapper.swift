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

    class func getJSONData(closure: (arr: Array<Dictionary<String,String>>) -> Void) {
        Alamofire.request(.GET, "https://hinge-homework.s3.amazonaws.com/client/services/homework.json") .responseJSON {
            response in
            
            if let json = response.result.value! as? AnyObject {
                closure(arr: json as! Array<Dictionary<String, String>>)
            }
            
        }
        
    }
    
}
