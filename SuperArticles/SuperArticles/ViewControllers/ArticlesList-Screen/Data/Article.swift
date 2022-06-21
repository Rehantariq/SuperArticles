//
//  Article.swift
//  SuperArticles
//
//  Created by Rehan tariq on 20/06/2022.
//

import Foundation


protocol AnyArticle {
    var title: String { get set }
    var publishedDate: String {get set}
}

struct Article : Codable, AnyArticle {
    var title: String
    var publishedDate: String

    private enum CodingKeys: String, CodingKey {
        case title
        case publishedDate = "published_date"
    }
}

struct ArticleSearch : Codable, AnyArticle {
    
    var title: String
    var publishedDate: String
    
    private enum CodingKeys: String, CodingKey {
        case title = "abstract"
        case publishedDate = "pub_date"
    }
}






