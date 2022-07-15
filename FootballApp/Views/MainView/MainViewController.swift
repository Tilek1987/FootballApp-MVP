//
//  MainViewController.swift
//  Instat
//
//  Created by Tilek Sulaymanbekov on 25/6/22.
//

import UIKit

class MainViewController: BaseTableViewController {

    var presenter: MainViewPresenterProtocol!
    var allLeagues: AllLeagues?
    var mainDataSource: MainTableViewDataSource!

    // MARK: - Setup
    
    override func setupUI() {
        super.setupUI()
        title = "All Leagues"
        tableView.or_registerCellNib(forClass: AllLeaguesTableViewCell.self)
        setupAction()
    }
    
    override func setupDataSource() {
        mainDataSource = MainTableViewDataSource(tableView: tableView)
        dataSource = mainDataSource
        super.setupDataSource()
    }
    
    // MARK: - Actions
    
    func setupAction() {
        mainDataSource.onLeagueSelected = { [weak self] league in
            self?.presenter.onTapLeague(league: league)
        }
    }
}

    // MARK: - Data

extension MainViewController: MainViewProtocol {
    func success() {
        mainDataSource.allLeagues = presenter.allLeagues
        tableView.reloadData()
    }
    
    func failure(error: Error) {
        print(error.localizedDescription)
    }
}
