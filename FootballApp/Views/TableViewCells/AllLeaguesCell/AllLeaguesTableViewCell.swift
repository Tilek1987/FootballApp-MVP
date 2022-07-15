//
//  AllLeaguesTableViewCell.swift
//  Instat
//
//  Created by Tilek Sulaymanbekov on 25/6/22.
//

import UIKit

class AllLeaguesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var abbreviation: UILabel!
    @IBOutlet weak var leagueName: UILabel!
    
    
    func configureCell(_ league: League) {
        abbreviation.text = league.abbr
        leagueName.text = league.name
        
        if let urlString = league.logos.light {
            logo.downloaded(from: urlString)
        }
    }
}
