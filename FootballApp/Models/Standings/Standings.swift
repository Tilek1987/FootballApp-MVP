//
//  Standings.swift
//  Instat
//
//  Created by Tilek Sulaymanbekov on 25/6/22.
//

import Foundation

struct Standings: Codable {
    let name: String
    let abbreviation: String?
    let seasonDisplay: String
    let season: Int
    let standings: [FootballClub]
}
