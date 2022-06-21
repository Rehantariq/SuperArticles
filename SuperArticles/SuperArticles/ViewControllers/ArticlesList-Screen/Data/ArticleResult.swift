//
//  ArticleResult.swift
//  SuperArticles
//
//  Created by Rehan tariq on 21/06/2022.
//

import Foundation

struct ArticleResult : Codable {
    var status: String!
    var articles: [Article]!
    var fault : FaultResult!
    
    private enum CodingKeys: String, CodingKey {
        case status
        case fault
        case articles = "results"
    }
}

struct ArticleSearchResult : Codable {
    var status: String!
    var response: Response!
    var fault : FaultResult!
    
    struct Response : Codable {
        var articles: [ArticleSearch]!
        
        private enum CodingKeys: String, CodingKey {
            case articles = "docs"
        }
    }
}

struct FaultResult : Codable {
    var faultstring: String!

}
