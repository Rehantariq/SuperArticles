//
//  AlamofireNetworkRequest.swift
//  SuperArticles
//
//  Created by Rehan tariq on 20/06/2022.
//

import Foundation
import Alamofire

class AlamofireNetworkRequest : NetworkRequest {
    
    private let sessionManager: SessionManager
    init(sessionManager: SessionManager = SessionManager.default) {
        self.sessionManager = sessionManager
    }
    
    func getData(url: URL, query: [String: Any]?, headers: [String: String]?  ) -> DataRequest {
        return self.sessionManager.request(url, method: .get, parameters: query,  headers: headers )
    }
}
