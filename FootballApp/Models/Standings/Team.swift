//
//  Team.swift
//  Instat
//
//  Created by Tilek Sulaymanbekov on 25/6/22.
//

import Foundation

struct Team: Codable {
    let location: String
    let abbreviation: String?
    let displayName: String
    let shortDisplayName: String
    let logos: [Logo]?
}
