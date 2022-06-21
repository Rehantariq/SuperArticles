//
//  ArticlesListViewController.swift
//  SuperArticles
//
//  Created by Rehan tariq on 20/06/2022.
//

import Foundation
import UIKit

class ArticlesListViewController: UIViewController  {
    
    //MARK: - "iVars"
     var presenter : ArticlesListViewPresenter! // Assignment through Dependency Injection
    
    //MARK: - "IBOutlet"
    @IBOutlet weak var tableView : UITableView!
    @IBOutlet weak var activityIndicatorView : UIActivityIndicatorView!
    @IBOutlet weak var messageLabel : UILabel!
    
    //MARK: - "ViewControllerLife"
    override func viewDidLoad() {
        activityIndicatorView.isHidden = true
        viewSetup()
    }
    
    private func viewSetup(){
        self.navigationItem.title = "Articles".loc
        presenter.view = self
        messageLabel.isHidden = true
        tableView.register(UINib(nibName: ArticleListCell.id, bundle: nil), forCellReuseIdentifier: ArticleListCell.id)
    }
}

extension ArticlesListViewController : ArticlesListViewDelegate {
    func updateView() {
        tableView.reloadData()
    }
    func showMessage(message: String) {
        messageLabel.text = message
        messageLabel.isHidden = false
    }
    func hideMessage() {
        messageLabel.isHidden = true
    }
    func showLoading() {
        activityIndicatorView.isHidden = false
    }
    func hideLoading() {
        activityIndicatorView.isHidden = true
    }
}
