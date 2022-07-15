//
//  Note.swift
//  Instat
//
//  Created by Tilek Sulaymanbekov on 25/6/22.
//

import Foundation

struct Note: Codable {
    let hexColor: String
    let description: String
    let rank: Int
    
    enum CodingKeys: String, CodingKey {
        case hexColor = "color"
        case description, rank
    }
}
