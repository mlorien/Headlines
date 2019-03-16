//
//  Headlines.swift
//  Headlines
//
//  Created by Lorien Moisyn on 15/03/19.
//  Copyright © 2019 Lorien Moisyn. All rights reserved.
//

import Foundation

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
    
    public enum CodingKeys: String, CodingKey {
        case author
        case title
        case description
        case publishedAt
    }
    
}
