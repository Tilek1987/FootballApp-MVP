//
//  FootballClub.swift
//  Instat
//
//  Created by Tilek Sulaymanbekov on 25/6/22.
//

import Foundation

struct FootballClub: Codable {
    let team: Team
    let note: Note?
    let stats: [Stat]
}
