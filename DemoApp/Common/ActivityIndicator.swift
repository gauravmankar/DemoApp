//
//  ActivityIndicator.swift
//  DemoApp
//
//  Created by Gaurav.Mankar on 16/10/20.
//  Copyright © 2020 Gaurav.Mankar. All rights reserved.
//

import Foundation
import UIKit

class ActivityIndicator {
    static var shared = ActivityIndicator()
    
    let backgroundView = UIView()
    let activityIndicator = UIActivityIndicatorView(style: .gray)
    
    private func setupView(){
        backgroundView.frame = CGRect(x: 0, y: 0, width: 75, height: 75)
        backgroundView.backgroundColor = UIColor(white: 0.0, alpha: 0.3)
        backgroundView.layer.cornerRadius = 5
        backgroundView.layer.masksToBounds = true
    }
    func showLoading(on viewController :UIViewController){
        setupView()
        backgroundView.center = viewController.view.center
        activityIndicator.center = viewController.view.center
        activityIndicator.startAnimating()
        viewController.view.addSubview(backgroundView)
        viewController.view.addSubview(activityIndicator)
    }
    
    func stopLoading(){
        activityIndicator.stopAnimating()
        backgroundView.removeFromSuperview()
        activityIndicator.removeFromSuperview()
    }
    
}
