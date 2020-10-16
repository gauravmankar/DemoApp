//
//  InfoListViewController.swift
//  DemoApp
//
//  Created by Gaurav.Mankar on 16/10/20.
//  Copyright © 2020 Gaurav.Mankar. All rights reserved.
//

import UIKit
import AlamofireImage

class InfoListViewController: UIViewController {

    var viewModel = InfoViewModel()
    
    
    /// Add tableview to display information list
    private lazy var infoTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorColor = .lightGray
        tableView.dataSource = self
        tableView.register(InfoTableViewCell.self, forCellReuseIdentifier: InfoTableViewCell.cellIdentifier)
        return tableView
    }()
    
    /// Pull to refresh to refresh information list
    private lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = .lightGray
        refreshControl.attributedTitle = NSAttributedString(string: "Refresh")
        return refreshControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .red
        self.refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        self.setupTableview()
        self.fetchInformation()
    }

    /// Add tableview to display information
    func setupTableview() {
        self.view.addSubview(infoTableView)

        infoTableView.translatesAutoresizingMaskIntoConstraints = false
        infoTableView.topAnchor.constraint(equalTo:self.view.topAnchor).isActive = true
        infoTableView.leftAnchor.constraint(equalTo:self.view.leftAnchor).isActive = true
        infoTableView.rightAnchor.constraint(equalTo:self.view.rightAnchor).isActive = true
        infoTableView.bottomAnchor.constraint(equalTo:self.view.bottomAnchor).isActive = true
        infoTableView.tableFooterView = UIView()
        infoTableView.rowHeight = UITableView.automaticDimension
        infoTableView.estimatedRowHeight = 120
        
        infoTableView.refreshControl = self.refreshControl
    }
    
    
    /// Description Refresh control method
    /// - Parameter sender: refresh control object
    @objc func refreshData(sender:UIRefreshControl) {
        sender.endRefreshing()
        self.fetchInformation()
    }
    
    func fetchInformation() {
        ActivityIndicator.shared.showLoading(on: self)
        viewModel.getAllInfoRows(completionHandler: { (status, message) in
            ActivityIndicator.shared.stopLoading()
            if status {
                self.title = self.viewModel.navigationBarTitle
                self.infoTableView.reloadData()
            }else{
                Utilities.sharedInstance.genarateAlertViewWithTitle(title: AppConstants.APPNAME, message: message, sender: self)
            }
        }) { (status, message) in
            Utilities.sharedInstance.genarateAlertViewWithTitle(title: AppConstants.APPNAME, message: message, sender: self)
        }
    }
}

extension InfoListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.rowsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: InfoTableViewCell.cellIdentifier, for: indexPath) as! InfoTableViewCell
        
        let row = viewModel.rowsData[indexPath.row]
        
        cell.infoTitle.text = row.title
        cell.infoDescription.text = row.description
      //  cell.infoDescription.sizeToFit()
        
        if row.imageReference != nil{
            let imageUrl = URL(string: row.imageReference!)
            cell.infoImageView.af.setImage(withURL: imageUrl!)
        }else{
            cell.infoImageView.image = UIImage(named: "ic_placeholder")
        }
        return cell
    }
    
}
