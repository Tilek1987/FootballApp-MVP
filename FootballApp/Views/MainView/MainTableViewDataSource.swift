//
//  MainTableViewDataSource.swift
//  Instat
//
//  Created by Tilek Sulaymanbekov on 25/6/22.
//

import Foundation
import UIKit

class MainTableViewDataSource: BaseTableViewDataSource {
    
    var allLeagues: AllLeagues?
    var onLeagueSelected: ((League) -> Void)!

    // MARK: - DataSource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        allLeagues?.data.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        makeAllLeaguesCell(indexPath: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        super.tableView(tableView, didSelectRowAt: indexPath)
        onLeagueSelected((allLeagues?.data[indexPath.row])!)
    }
    
    // MARK: - Helpers
    
    func makeAllLeaguesCell(indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(ofType: AllLeaguesTableViewCell.self)
        let league = allLeagues?.data[indexPath.row]
        cell.configureCell(league!)
        return cell
    }
}

