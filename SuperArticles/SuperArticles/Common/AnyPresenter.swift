//
//  AnyPresenter.swift
//  SuperArticles
//
//  Created by Rehan tariq on 20/06/2022.
//

import Foundation

protocol AnyPresenter  {
    associatedtype ViewDelegate
    var view: ViewDelegate { get set }
    
    func didAttachView()
    func didDetachView()
}

extension AnyPresenter {
    func didAttachView(){}
    func didDetachView(){}
}

