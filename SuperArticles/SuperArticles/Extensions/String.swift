//
//  String.swift
//  SuperArticles
//
//  Created by Rehan tariq on 21/06/2022.
//

import Foundation

extension String {
    var loc: String { /// localized
        return NSLocalizedString(self, comment: "")
    }
}
