//
//  ArticleListScreenPresenterTest.swift
//  SuperArticlesTests
//
//  Created by Rehan tariq on 21/06/2022.
//

import Foundation
import XCTest
@testable import SuperArticles

class ArticleListScreenTest: XCTestCase  {
    
    var articlesListViewController: ArticlesListViewController! = nil
    let articleList : [ArticleSearch] = [ ArticleSearch(title: "title", publishedDate: "12-12-2022") ]

    override func setUp() {
        continueAfterFailure = false
        articlesListViewController = ArticlesListViewController.instanticate(appStoryboard: .Articles)
        let articleSercie = ArticleService(networkRequest: AlamofireNetworkRequest())
        articlesListViewController.presenter = ArticlesListViewPresenter(articleViewType: .Search, articleService: articleSercie,articles:articleList)
        
        let _ = articlesListViewController.view
    }
    
    func test_isViewSet() {
        XCTAssertNotNil(articlesListViewController.presenter.view)
    }
    
    func test_isViewTypeSet() {
        XCTAssertNotNil(articlesListViewController.presenter.articleViewType)
    }
    
    func test_isRightViewTypeSet() {
        XCTAssertTrue(articlesListViewController.presenter.articleViewType == .Search)
    }
    
    func test_tableViewConfigured() {
        XCTAssertNotNil(articlesListViewController.tableView)
    }

    func test_tableViewRowCount() {
        let rowsCount = articlesListViewController.tableView.numberOfRows(inSection: 0)
        XCTAssertTrue(articleList.count == rowsCount)
    }
    
    func test_isLoadingViewHiddenOnDataLoad() {
        XCTAssertTrue(articlesListViewController.activityIndicatorView.isHidden == true)
    }
    
    func test_isMessageViewHiddenOnDataLoad() {
        XCTAssertTrue(articlesListViewController.messageLabel.isHidden == true)
    }
    
    func test_tableViewCellTitleSet() {
        articlesListViewController.tableView.reloadData()
        let cell = articlesListViewController.tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! ArticleListCell
        XCTAssertTrue(cell.titleLabel.text  == articleList.first?.title)
    }
    
    func test_tableViewCellDateSet() {
        articlesListViewController.tableView.reloadData()
        let cell = articlesListViewController.tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! ArticleListCell
        XCTAssertTrue(cell.dateLabel.text  == articleList.first?.publishedDate)
    }

}
