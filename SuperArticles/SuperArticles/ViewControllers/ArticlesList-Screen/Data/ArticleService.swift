//
//  ArticleService.swift
//  SuperArticles
//
//  Created by Rehan tariq on 20/06/2022.
//

import Foundation
import Alamofire

typealias ResultData<T> = (T? , _ error: Error?) -> Void

class ArticleService: AnyArticleService {
    
    private let networkRequest: NetworkRequest
    private let mostPopular = "/mostpopular/v2/"
    private let search = "/search/v2/"
    private let period = "1"
    
    init( networkRequest:NetworkRequest){
        self.networkRequest = networkRequest
    }
    
    private func url(path: String) -> URL {
        let original = networkRequest.baseUrl + path
        if let encoded = original.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed),let url = URL(string: encoded)
        {
            return  url.absoluteURL
        }
        return  URL(string: networkRequest.baseUrl + path )!.absoluteURL
    }
    
    private func fatchData<T : Codable>(url: URL, completion: @escaping ResultData<T> ){
        self.networkRequest.getData(url:url, query: nil, headers: nil).responseData { (response : DataResponse<Data>) in
            switch response.result {
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    let items = try decoder.decode(T.self, from: data)
                    completion(items, nil)
                }catch {
                    completion(nil, error)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    func searchArticle<T : Codable>(term:String, viewType: ArticleViewType, completion: @escaping ResultData<T> )  {
        let path = search + viewType.urlPath  + ".json?api-key=" + networkRequest.apiKey + "&q=" + term
        fatchData(url:  url(path: path ), completion: completion)
    }
    
    func loadMostPopular<T : Codable>(viewType: ArticleViewType, completion: @escaping ResultData<T> )  {
        let path =  mostPopular + viewType.urlPath + period + ".json?api-key=" + networkRequest.apiKey
        fatchData(url:  url(path: path ), completion: completion)
    }
}
