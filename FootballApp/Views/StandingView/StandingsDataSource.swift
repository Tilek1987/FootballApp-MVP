//
//  StandingsDataSource.swift
//  Instat
//
//  Created by Tilek Sulaymanbekov on 26/6/22.
//

import Foundation
import UIKit

class StandingsDataSource: BaseTableViewDataSource {
    
    var allStandings: AllStandings?
    
    // MARK: - Datasource methods
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueCell(ofType: TeamCellTableViewCell.self)
        cell.configureHeaderView()
        return cell.contentView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        56
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        allStandings?.data.standings.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        makeTeamCell(indexPath: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        super.tableView(tableView, didSelectRowAt: indexPath)
    }
    
    // MARK: - Datasource methods
    
    func makeTeamCell(indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(ofType: TeamCellTableViewCell.self)
        let team = allStandings?.data.standings[indexPath.row]
        cell.rankLabel.text = team?.stats.getStatistics(type: .rank)
        if let urlString = team?.team.logos?.first?.url {
            cell.teamLogo.downloaded(from: urlString)
        }
        cell.teamName.text = team?.team.displayName
        cell.gamesPlayed.text = team?.stats.getStatistics(type: .gamesplayed)
        cell.winsLabel.text = team?.stats.getStatistics(type: .wins)
        cell.drawLabel.text = team?.stats.getStatistics(type: .ties)
        cell.losesLabel.text = team?.stats.getStatistics(type: .losses)
        cell.pointsLabel.text = team?.stats.getStatistics(type: .points)
        return cell
    }
}
