//
//  LeagueSeaonsViewController.swift
//  Instat
//
//  Created by Tilek Sulaymanbekov on 25/6/22.
//

import UIKit

class LeagueSeasonsViewController: BaseTableViewController {
    
    var presenter: LeagueSeasonsViewPresenterProtocol!
    var allSeasons: AllSeasons?
    var leagueSeaonsDataSource: LeagueSeasonsDataSource!
    var router: RouterProtocol!
    
    // MARK: - Setup
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.getAllSeasons()
        leagueSeaonsDataSource.league = presenter.league
    }
    
    override func setupUI() {
        super.setupUI()
        title = "All Seasons"
        tableView.or_registerCellNib(forClass: AllLeaguesTableViewCell.self)
        setupAction()
    }
    
    override func setupDataSource() {
        leagueSeaonsDataSource = LeagueSeasonsDataSource(tableView: tableView)
        dataSource = leagueSeaonsDataSource
        super.setupDataSource()
    }
    
    // MARK: - Actions
    
    func setupAction() {
        leagueSeaonsDataSource.onSeasonTap = { [weak self] season in
            guard let self = self else { return }
            self.presenter.onSeasonTap(season: season, league: self.presenter.league!)
        }
    }
}

// MARK: - Data

extension LeagueSeasonsViewController: LeagueSeasonsViewProtocol {
    func success() {
        leagueSeaonsDataSource.allSeasons = presenter.allSeasons
        tableView.reloadData()
    }
    
    func failure(error: Error) {
        print(error.localizedDescription)
    }
}
