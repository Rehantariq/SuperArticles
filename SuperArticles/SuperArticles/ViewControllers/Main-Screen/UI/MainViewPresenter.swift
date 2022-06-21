//
//  MainViewPresenter.swift
//  SuperArticles
//
//  Created by Rehan tariq on 20/06/2022.
//

import Foundation

class MainViewPresenter : AnyPresenter {
    let sections: [String] = ["Search".loc,"Popular".loc]
    let sectionRows: [[ArticleViewType]] = [[.Search],
                                            [.MostViewed, .MostShared, .MostEmailed]]
    typealias ViewDelegate = MainViewDelegate?
    var view: MainViewDelegate?{
        didSet {
            if let _ = view {
            didAttachView()
            }
        }
    }
}

