//
//  Stat.swift
//  Instat
//
//  Created by Tilek Sulaymanbekov on 25/6/22.
//

import Foundation

struct Stat: Codable {
    let displayName: String
    let abbreviation: String
    let description: String
    let displayValue: String
    let type: StatType
}
