//
//  ArticlesListViewDelegate.swift
//  SuperArticles
//
//  Created by Rehan tariq on 20/06/2022.
//

import Foundation

protocol ArticlesListViewDelegate {
    
    func updateView()
    
    func showLoading()
    func hideLoading()
    
    func showMessage(message: String)
    func hideMessage()
}
