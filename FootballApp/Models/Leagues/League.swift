//
//  League.swift
//  Instat
//
//  Created by Tilek Sulaymanbekov on 25/6/22.
//

import Foundation

struct League: Codable {
    let id: String
    let name: String
    let abbr: String
    let logos: Logos
}
