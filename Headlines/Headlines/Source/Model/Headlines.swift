//
//  Headlines.swift
//  Headlines
//
//  Created by Lorien Moisyn on 15/03/19.
//  Copyright © 2019 Lorien Moisyn. All rights reserved.
//

import UIKit

public struct HeadlineList: Decodable {
    
    var articles: [Headline]
    
    public enum CodingKeys: String, CodingKey {
        case articles
    }
    
}

public struct Headline: Decodable {
    
    var author: String!
    var title: String!
    var description: String!
    var publishedAt: String!
    var urlToImage: String!
    var url: String!
    
    public enum CodingKeys: String, CodingKey {
        case author
        case title
        case description
        case publishedAt
        case urlToImage
        case url
    }
    
}
