//
//  ArticlesListViewPresenter.swift
//  SuperArticles
//
//  Created by Rehan tariq on 20/06/2022.
//

import Foundation

class ArticlesListViewPresenter: AnyPresenter {
    
    let articleViewType: ArticleViewType
    let articleService: ArticleService
    var articles: [AnyArticle] = []
    
    typealias ViewDelegate = ArticlesListViewDelegate?
    var view: ArticlesListViewDelegate?{
        didSet {
            if let _ = view {
            didAttachView()
            }
        }
    }
    
    init(articleViewType: ArticleViewType, articleService: ArticleService ){
        self.articleViewType =  articleViewType
        self.articleService = articleService
    }
    /// For search flow
    init(articleViewType: ArticleViewType, articleService: ArticleService, articles: [AnyArticle] ){
        self.articleViewType =  articleViewType
        self.articleService = articleService
        self.articles = articles
    }
    
    func didAttachView() {
        if articleViewType != .Search {
           loadArticles()
        }
    }
    
    func loadArticles(){
        view?.showLoading()
        articleService.loadMostPopular(viewType: articleViewType) {[weak self] (result: ArticleResult?, error: Error?) in
            guard let self = self else {return}
            self.view?.hideLoading()
            self.articles = []
            if let error = error {
                self.view?.showMessage(message: error.localizedDescription )
            }else{
                if let _ = result?.status {
                    self.articles = result?.articles ?? []
                    self.view?.hideMessage()
                }else {
                    if let fault = result?.fault {
                        self.view?.showMessage(message: fault.faultstring)
                    }
                }
            }
            self.view?.updateView()
        }
    }
}
