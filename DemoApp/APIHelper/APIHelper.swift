//
//  APIHelper.swift
//  DemoApp
//
//  Created by Gaurav.Mankar on 16/10/20.
//  Copyright © 2020 Gaurav.Mankar. All rights reserved.
//

import Foundation
import Alamofire
import CodableAlamofire

class APIHelper : NSObject {
    
    static var sharedInstance = APIHelper()
    
    private override init() {
    }
    
    let headers: HTTPHeaders = [
        "Content-Type": "application/json"
    ]
    
    func requestGETURL(_ strURL: String, completionHandler:@escaping (AFDataResponse<String>) -> Void, failure:@escaping (AFError) -> Void) {
        AF.request(strURL, method: .get, headers: headers).responseString { (responseObject) in
            if responseObject.error == nil {
                completionHandler(responseObject)
            }else{
                failure(responseObject.error!)
            }
        }
    }
}
