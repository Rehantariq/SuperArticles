//
//  ArticleSearchViewDelegate.swift
//  SuperArticles
//
//  Created by Rehan tariq on 20/06/2022.
//

import Foundation

protocol ArticleSearchViewDelegate {
    
    func moveToArticleListScreen()
    
    func showLoading()
    func hideLoading()
    
    func showMessage(message: String)
    func hideMessage()
}
