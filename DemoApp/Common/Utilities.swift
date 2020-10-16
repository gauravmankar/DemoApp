//
//  Utilities.swift
//  DemoApp
//
//  Created by Gaurav.Mankar on 16/10/20.
//  Copyright © 2020 Gaurav.Mankar. All rights reserved.
//

import Foundation
import UIKit

class Utilities {
    
    /// Singleton object of class
    static var sharedInstance = Utilities()
    
    private init(){
    }
    
    /// Function to  show alert view controller.
    /// - Parameters:
    ///   - title: Title of alert view
    ///   - message: Message to show on alert view
    ///   - sender: Object of View controller on which alert should be shown.
    
    func genarateAlertViewWithTitle(title: String, message: String, sender: UIViewController) -> Void{
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        sender.present(alert, animated: true, completion: nil)
    }
}
