//
//  NewConversationViewController.swift
//  ChatApp
//
//  Created by Adrian Derdaś on 23/03/2023.
//

import UIKit
import JGProgressHUD

class NewConversationViewController: UIViewController {

    private let spinner = JGProgressHUD()
    
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search for users..."
        return searchBar
    }()
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.isHidden = true
        table.register(UITableViewCell.self,
                       forCellReuseIdentifier: "cell")
        return table
    }()
    
    private let noResultsTable: UILabel = {
       let label = UILabel()
        label.text = "No Results"
        label.isHidden = true
        label.textAlignment = .center
        label.textColor = .green
        label.font = .systemFont(ofSize: 21, weight: .medium)
        return label
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        view.backgroundColor = .white
        navigationController?.navigationBar.topItem?.titleView = searchBar
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Cancel",
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(dismissSelf))
        

    //    searchBar.becomeFirstResponder()
    }
    
    @objc private func dismissSelf() {
        dismiss(animated: true, completion: nil)
    }

    


}

extension NewConversationViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // do nothing
    }
}
