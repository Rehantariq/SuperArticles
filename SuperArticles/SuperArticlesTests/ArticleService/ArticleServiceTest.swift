//
//  ArticleServiceTest.swift
//  SuperArticlesTests
//
//  Created by Rehan tariq on 21/06/2022.
//

import Foundation
import XCTest
@testable import SuperArticles

 class ArticleServiceTest: XCTestCase  {
    
  //  let articleService = MockArticleService()  //ArticleService(networkRequest: AlamofireNetworkRequest())
    let articleService = ArticleService(networkRequest: AlamofireNetworkRequest())
    
    override func setUp() {
         continueAfterFailure = false
    }
    
    override func tearDown() {

    }
    
    func testSearchAritcles() {
            
           let gotResponseExpectation = XCTestExpectation(description: "Search Aritcles")
            
            articleService.searchArticle(term: "New", viewType: .Search) { (result: ArticleSearchResult?,error: Error?)  in
                if let  error = error {
                    XCTFail(error.localizedDescription)
                    return
                }
                
                if let _ = result?.status {
                    if let _ = result?.response.articles {
                         gotResponseExpectation.fulfill()
                    }else{
                        XCTFail()
                    }
                }else{
                    XCTFail()
                }
                
            }
        wait(for: [gotResponseExpectation], timeout: 15.0)
    }

    func testMostEmailed() {
        
       let gotResponseExpectation = XCTestExpectation(description: "Most Emailed")
        
        articleService.loadMostPopular(viewType: .MostEmailed) {(result: ArticleResult?,error: Error?) in
            if let  error = error {
                XCTFail(error.localizedDescription)
                return
            }
             
            if let _ = result?.status {
                if let _ = result?.articles {
                     gotResponseExpectation.fulfill()
                }else{
                    XCTFail()
                }
            }else{
                XCTFail()
            }
            
        }
        wait(for: [gotResponseExpectation], timeout: 5.0)
    }
    
    func testMostViewed() {
        
       let gotResponseExpectation = XCTestExpectation(description: "Most Viewed")
        
        articleService.loadMostPopular(viewType: .MostViewed) {(result: ArticleResult?,error: Error?) in
            if let  error = error {
                XCTFail(error.localizedDescription)
                return
            }
            if let _ = result?.status {
                if let _ = result?.articles {
                     gotResponseExpectation.fulfill()
                }else{
                    XCTFail()
                }
            }else{
                XCTFail()
            }
            
        }
        wait(for: [gotResponseExpectation], timeout: 5.0)
    }
    
    func testMostShared() {
        
       let gotResponseExpectation = XCTestExpectation(description: "Most Shared")
        
        articleService.loadMostPopular(viewType: .MostShared) {(result: ArticleResult?,error: Error?) in
            if let  error = error {
                XCTFail(error.localizedDescription)
                return
            }
            if let _ = result?.status {
                if let _ = result?.articles {
                     gotResponseExpectation.fulfill()
                }else{
                    XCTFail()
                }
            }else{
                XCTFail()
            }
            
        }
        wait(for: [gotResponseExpectation], timeout: 5.0)
    }
    
}
