//
//  StandingsViewController.swift
//  Instat
//
//  Created by Tilek Sulaymanbekov on 26/6/22.
//

import UIKit

class StandingsViewController: BaseTableViewController {
    
    var standingsDataSource: StandingsDataSource!
    var presenter: StandingsPresenter!
    var router: RouterProtocol!

    // MARK: - Setup
    
    override func setupUI() {
        super.setupUI()
        title = "Standing"
        tableView.or_registerCellNib(forClass: TeamCellTableViewCell.self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.getStandings()
    }

    override func setupDataSource() {
        standingsDataSource = StandingsDataSource(tableView: tableView)
        dataSource = standingsDataSource
        super.setupDataSource()
    }
}

// MARK: - Data

extension StandingsViewController: StandingsViewProtocol {
    func success(data: AllStandings) {
        standingsDataSource.allStandings = data
        tableView.reloadData()
    }
    
    func failure(error: Error) {
        print(error.localizedDescription)
    }
}
