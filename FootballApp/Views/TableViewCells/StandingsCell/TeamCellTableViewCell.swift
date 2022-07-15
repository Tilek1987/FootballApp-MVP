//
//  TeamCellTableViewCell.swift
//  Instat
//
//  Created by Tilek Sulaymanbekov on 26/6/22.
//

import UIKit

class TeamCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var teamLogo: UIImageView!
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var gamesPlayed: UILabel!
    @IBOutlet weak var winsLabel: UILabel!
    @IBOutlet weak var drawLabel: UILabel!
    @IBOutlet weak var losesLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    
    func configureHeaderView() {
        teamLogo.isHidden = true
        rankLabel.text = "№"
        teamName.text = "Club"
        gamesPlayed.text = "GP"
        winsLabel.text = "W"
        drawLabel.text = "D"
        losesLabel.text = "L"
        pointsLabel.text = "P"
    }
}
