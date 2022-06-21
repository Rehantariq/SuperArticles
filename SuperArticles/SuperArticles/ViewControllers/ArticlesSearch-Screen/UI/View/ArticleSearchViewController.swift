//
//  ArticleSearchViewController.swift
//  SuperArticles
//
//  Created by Rehan tariq on 20/06/2022.
//

import Foundation
import UIKit

class ArticleSearchViewController: UIViewController  {
    
    //MARK: - "iVars"
    var presenter : ArticleSearchViewPresenter! // Assignment through Dependency Injection
    
    //MARK: - "IBOutlet"
    @IBOutlet weak var searchBar : UISearchBar!
    @IBOutlet weak var searchButton : UIButton!
    @IBOutlet weak var activityIndicatorView : UIActivityIndicatorView!
    @IBOutlet weak var messageLabel : UILabel!
    
    //MARK: - "IBAtions"
    @IBAction func tapOnSearchButton( sender: UIButton ){
        searchArticle()
    }
    //MARK: - "ViewControllerLife"
    override func viewDidLoad() {
        viewSetup()
    }
    private func viewSetup(){
        navigationItem.title = "Search".loc
        presenter.view = self
        view.backgroundColor = .primaryLightColor
        searchBar.becomeFirstResponder()
        activityIndicatorView.isHidden = true
        messageLabel.isHidden = true
        updateSearchButton()
    }
    func searchArticle(){
        if let term = searchBar.text?.trimmingCharacters(in: CharacterSet.whitespaces), term.count > 0 {
           presenter.searchArticles(term: term)
            searchBar.resignFirstResponder()
        }
    }
    func updateSearchButton(){
        if let text  = searchBar.text?.trimmingCharacters(in: .whitespacesAndNewlines), text.count > 0 {
            searchButton.backgroundColor = .accentColor
        }else{
            searchButton.backgroundColor = .lightGray
        }
    }
}

extension ArticleSearchViewController: ArticleSearchViewDelegate {
    func showMessage(message: String) {
        messageLabel.text = message
        messageLabel.isHidden = false
        searchBar.becomeFirstResponder()
    }
    func hideMessage() {
        messageLabel.isHidden = true
    }
    func showLoading() {
        activityIndicatorView.isHidden = false
        searchButton.isHidden = true
    }
    func hideLoading() {
        activityIndicatorView.isHidden = true
        searchButton.isHidden = false
    }
    func moveToArticleListScreen() {
        let vc = ArticlesListViewController.instanticate(appStoryboard: .Articles)
        let articleService = ArticleService(networkRequest: AlamofireNetworkRequest())
        vc.presenter = ArticlesListViewPresenter(articleViewType: presenter.articleViewType, articleService:articleService,articles: presenter.articles )
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension ArticleSearchViewController:  UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchArticle()
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        hideMessage()
        updateSearchButton()
    }
}
