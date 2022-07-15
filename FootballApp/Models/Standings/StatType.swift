//
//  StatType.swift
//  Instat
//
//  Created by Tilek Sulaymanbekov on 26/6/22.
//

import Foundation

public enum StatType: String, Codable {
    case wins, losses, ties, gamesplayed
    case pointsfor, pointsagainst, points
    case rankchange, rank, pointdifferential
    case deductions, ppg, total
}
