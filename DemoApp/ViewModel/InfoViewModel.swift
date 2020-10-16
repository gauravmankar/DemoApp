//
//  InfoViewModel.swift
//  DemoApp
//
//  Created by Gaurav.Mankar on 16/10/20.
//  Copyright © 2020 Gaurav.Mankar. All rights reserved.
//

import Foundation

class InfoViewModel: NSObject {
    static var shared = InfoViewModel()
    
    var navigationBarTitle = String()
    
    var rowsData = [Row]()
    
    override init() {
        super.init()
    }
    
    func getAllInfoRows(completionHandler: @escaping SuccessBlock, failure: @escaping FailureBlock) {
        APIHelper.sharedInstance.requestGETURL(APIConstants.baseUrl, completionHandler: { (responseData) in
            print(responseData)
            do {
                guard let mydata = String(decoding: responseData.data!, as: UTF8.self).data(using: .utf8) else {return}
                
                let response = try JSONDecoder().decode(InfoModel.self, from: mydata)
                if response.rows?.count != 0 {
                    self.navigationBarTitle = response.title!
                    self.rowsData = response.rows!
                    completionHandler(true, "")
                }else{
                    completionHandler(false, "No data found")
                }
            } catch {
              //  print(error)
                failure(false, error.localizedDescription)
            }
        }) { (error) in
            print(error)
        }
    }
    
    
    
    
}
