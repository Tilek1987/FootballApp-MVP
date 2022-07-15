//
//  Season.swift
//  Instat
//
//  Created by Tilek Sulaymanbekov on 25/6/22.
//

import Foundation

struct Season: Codable {
    let year: Int
    let startDate: String
    let endDate: String
    let displayName: String
    let types: [Types]
}
