//
//  BaseTableViewController.swift
//  Instat
//
//  Created by Tilek Sulaymanbekov on 25/6/22.
//

import UIKit

class BaseTableViewController: BaseViewController {
    
    var tableView = UITableView()
    var tableViewHeight: NSLayoutConstraint!
    var dataSource: BaseTableViewDataSource!
    
    // MARK: - Setup

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDataSource()
        setupUI()
    }
    
    func setupDataSource() {
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
    }
    
    func setupUI() {
        view.addSubview(tableView)
        addConstraints()
    }
    
    func addConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
}
