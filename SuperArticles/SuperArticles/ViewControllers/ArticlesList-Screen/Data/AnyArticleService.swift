//
//  AnyArticleService.swift
//  SuperArticles
//
//  Created by Rehan tariq on 21/06/2022.
//

import Foundation


protocol AnyArticleService {
    
    func searchArticle<T : Codable>(term:String, viewType: ArticleViewType, completion: @escaping ResultData<T> )
    
    func loadMostPopular<T : Codable>(viewType: ArticleViewType, completion: @escaping ResultData<T> )

}
