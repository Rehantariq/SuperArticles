//
//  TableView-MainViewController.swift
//  SuperArticles
//
//  Created by Rehan tariq on 20/06/2022.
//

import UIKit


extension MainViewController : UITableViewDelegate, UITableViewDataSource  {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.sections.count
    }
    func tableView(_ tableView : UITableView,  titleForHeaderInSection section: Int) -> String? {
        return presenter.sections[section]
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 44
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.sectionRows[section].count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainViewCell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = presenter.sectionRows[indexPath.section][indexPath.row].description
        cell.selectionStyle = .none
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        moveToArticlesScreen(viewType: presenter.sectionRows[indexPath.section][indexPath.row])
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
