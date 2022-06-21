//
//  ArticleListCell.swift
//  SuperArticles
//
//  Created by Rehan tariq on 21/06/2022.
//

import UIKit

class ArticleListCell: UITableViewCell {
    static let id: String = "ArticleListCell"
    
    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var dateLabel : UILabel!
    override func awakeFromNib() {
        selectionStyle = .none
    }
    
    var article : AnyArticle? {
        didSet{
            titleLabel.text = article?.title
            dateLabel.text = article?.publishedDate
        }
        
    }
}
