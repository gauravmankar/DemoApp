//
//  InfoTableViewCell.swift
//  DemoApp
//
//  Created by Gaurav.Mankar on 16/10/20.
//  Copyright © 2020 Gaurav.Mankar. All rights reserved.
//

import UIKit

class InfoTableViewCell: UITableViewCell {

    static let cellIdentifier = "cell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    let containerView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    let infoImageView:UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.translatesAutoresizingMaskIntoConstraints = false
        img.clipsToBounds = true
        img.image = UIImage(named: "ic_placeholder")
        return img
        
    }()
    
    let infoTitle:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        return label
    }()
    
    let infoDescription:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor =  .darkGray
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(infoImageView)
        self.contentView.addSubview(infoTitle)
        self.contentView.addSubview(infoDescription)

        infoImageView.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:10).isActive = true
        infoImageView.topAnchor.constraint(equalTo:self.contentView.topAnchor, constant:10).isActive = true
        infoImageView.widthAnchor.constraint(equalToConstant:90).isActive = true
        infoImageView.heightAnchor.constraint(equalToConstant:90).isActive = true
        
        infoTitle.topAnchor.constraint(equalTo:self.contentView.topAnchor, constant: 10).isActive = true
        infoTitle.leadingAnchor.constraint(equalTo:self.infoImageView.trailingAnchor, constant: 10).isActive = true
        infoTitle.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant: -10).isActive = true
        infoTitle.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        infoDescription.topAnchor.constraint(equalTo:self.infoTitle.bottomAnchor, constant: 10).isActive = true
        infoDescription.leadingAnchor.constraint(equalTo:self.infoTitle.leadingAnchor).isActive = true
        infoDescription.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant: -10).isActive = true
        infoDescription.bottomAnchor.constraint(equalTo:self.contentView.bottomAnchor, constant: -10).isActive = true
        infoDescription.heightAnchor.constraint(greaterThanOrEqualToConstant: 100).isActive = true

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
