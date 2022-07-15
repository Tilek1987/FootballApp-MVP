//
//  LeagueSeasonsDataSource.swift
//  Instat
//
//  Created by Tilek Sulaymanbekov on 25/6/22.
//

import Foundation
import UIKit

class LeagueSeasonsDataSource: BaseTableViewDataSource {
    
    var allSeasons: AllSeasons?
    var league: League?
    var onSeasonTap: ((Season) -> Void)!
    
    // MARK: - DataSource Methods
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = LogoView()
        view.configureView(data: league!)
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        120
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        allSeasons?.data.seasons.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = allSeasons?.data.seasons[indexPath.row].displayName
        cell.textLabel?.numberOfLines = 2
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        super.tableView(tableView, didSelectRowAt: indexPath)
        onSeasonTap?(allSeasons!.data.seasons[indexPath.row])
    }
}
