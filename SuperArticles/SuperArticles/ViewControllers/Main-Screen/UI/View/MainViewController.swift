//
//  MainViewController.swift
//  SuperArticles
//
//  Created by Rehan tariq on 20/06/2022.
//

import Foundation
import UIKit

class MainViewController : UIViewController  {
    
    //MARK: - "iVars"
    var presenter : MainViewPresenter! // Assignment through Dependency Injection
    
    //MARK: - "IBOutlet"
    @IBOutlet weak var tableView : UITableView!
    
    //MARK: - "ViewControllerLife"
    override func viewDidLoad() {
        viewSetup()
    }
    
    private func viewSetup(){
        self.navigationItem.title = "Home".loc
        presenter.view = self
        
    }
}

extension MainViewController : MainViewDelegate {
    func moveToArticlesScreen(viewType: ArticleViewType){
        
        if viewType == .Search {
            let vc = ArticleSearchViewController.instanticate(appStoryboard: .Articles)
            // Dependencies
            let articleService = ArticleService(networkRequest: AlamofireNetworkRequest())
            vc.presenter = ArticleSearchViewPresenter(articleViewType: viewType, articleService: articleService)
            
            self.navigationController?.pushViewController(vc, animated: true)
        }else{
            let vc = ArticlesListViewController.instanticate(appStoryboard: .Articles)
            // Dependencies
            let articleService = ArticleService(networkRequest: AlamofireNetworkRequest())
            vc.presenter = ArticlesListViewPresenter(articleViewType: viewType, articleService: articleService)
            self.navigationController?.pushViewController(vc, animated: true)
        }

    }
}

