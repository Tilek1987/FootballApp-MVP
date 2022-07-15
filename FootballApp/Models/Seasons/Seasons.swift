//
//  Seasons.swift
//  Instat
//
//  Created by Tilek Sulaymanbekov on 25/6/22.
//

import Foundation

struct Seasons: Codable {
    let name: String?
    let abbreviation: String?
    let desc: String
    let seasons: [Season]
}
