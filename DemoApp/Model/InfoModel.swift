//
//  InfoModel.swift
//  DemoApp
//
//  Created by Gaurav.Mankar on 16/10/20.
//  Copyright © 2020 Gaurav.Mankar. All rights reserved.
//

import Foundation

struct InfoModel: Codable {
    var title: String?
    var rows: [Row]?
}

struct Row: Codable {
    var title:String?
    var description:String?
    var imageReference:String?
    
    private enum CodingKeys: String, CodingKey {
        case title
        case description
        case imageReference = "imageHref"
    }
    
}
