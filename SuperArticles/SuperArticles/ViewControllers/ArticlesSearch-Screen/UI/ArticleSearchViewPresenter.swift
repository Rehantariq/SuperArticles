//
//  ArticleSearchViewPresenter.swift
//  SuperArticles
//
//  Created by Rehan tariq on 20/06/2022.
//

import Foundation

class ArticleSearchViewPresenter: AnyPresenter {
    
    let articleViewType: ArticleViewType
    let articleService: ArticleService
    var articles: [AnyArticle] = []
    
    typealias ViewDelegate = ArticleSearchViewDelegate?
    var view: ArticleSearchViewDelegate?{
        didSet {
            if let _ = view {
            didAttachView()
            }
        }
    }
    
    init(articleViewType: ArticleViewType, articleService: ArticleService){
        self.articleViewType =  articleViewType
        self.articleService = articleService
    }
    
    func searchArticles(term:String){
        self.view?.showLoading()
        articleService.searchArticle(term: term, viewType: articleViewType) {[weak self] (result: ArticleSearchResult?, error: Error?) in
            guard let self = self else {return}
            self.view?.hideLoading()
            self.articles = []
            if error != nil {
                self.view?.showMessage(message: error!.localizedDescription)
            }else{
                if let _ = result?.status {
                    self.articles = result?.response.articles ?? []
                    if self.articles.count > 0 {
                       self.view?.moveToArticleListScreen()
                       self.view?.hideMessage()
                    }else{
                        self.view?.showMessage(message: "No Article Found".loc)
                    }
                }else{
                    if let fault = result?.fault {
                        self.view?.showMessage(message: fault.faultstring)
                    }
                }
            }
        }
    }
}
