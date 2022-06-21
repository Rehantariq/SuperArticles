//
//  ArticleViewType.swift
//  SuperArticles
//
//  Created by Rehan tariq on 20/06/2022.
//

import Foundation

enum ArticleViewType : String {
    case Search
    case MostViewed
    case MostShared
    case MostEmailed
    
    var description : String {
        switch self {
        case .Search: return "Search Articles".loc
        case .MostViewed: return "Most Viewed".loc
        case .MostShared: return "Most Shared".loc
        case .MostEmailed: return "Most Emailed".loc
        }
      }
    
    var urlPath : String {
        switch self {
        case .Search: return "articlesearch"
        case .MostViewed: return "viewed/"
        case .MostShared: return "shared/"
        case .MostEmailed: return "emailed/"
        }
      }
}


