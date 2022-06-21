//
//  MockArticleService.swift
//  SuperArticlesTests
//
//  Created by Rehan tariq on 21/06/2022.
//

import Foundation
import UIKit
@testable import SuperArticles

class MockArticleService {
 

    let mockMostPopularResponse = "{ \"status\": \"OK\", \"results\": [{\"title\": \"Biden Takes Tumble\", \"published_date\": \"2022-06-18\"}]}"
    
    let mockSearchResponse = "{ \"status\": \"OK\", \"response\": { \"docs\": [{\"abstract\": \"Biden Takes Tumble\", \"pub_date\": \"2022-06-18\"}]}}"
}

extension MockArticleService: AnyArticleService {
    func searchArticle<T>(term: String, viewType: ArticleViewType, completion: @escaping ResultData<T>) where T : Decodable, T : Encodable {
        let testData =  Data(self.mockSearchResponse.utf8)
        let decoder = JSONDecoder()
        do {
           let items = try decoder.decode(T.self, from: testData)
           completion(items, nil)
        }catch {
           completion(nil, error)
        }
        
    }
    
    func loadMostPopular<T>(viewType: ArticleViewType, completion: @escaping ResultData<T>) where T : Decodable, T : Encodable {
        
        let testData =  Data(self.mockMostPopularResponse.utf8)
        let decoder = JSONDecoder()
        do {
           let items = try decoder.decode(T.self, from: testData)
           completion(items, nil)
        }catch {
           completion(nil, error)
        }
    }
    
}

