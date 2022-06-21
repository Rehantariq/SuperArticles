//
//  NetworkRequest.swift
//  SuperArticles
//
//  Created by Rehan tariq on 20/06/2022.
//

import Foundation
import Alamofire

protocol NetworkRequest {
    func getData(url: URL, query: [String: Any]?, headers: [String: String]?) -> DataRequest
}

extension NetworkRequest {
    var baseUrl: String {
        return "https://api.nytimes.com/svc/"
    }
    var apiKey: String {
        return "udr0tDEUZgUU1c6XgRpGEeZbnDw46RCg"
    }
}
