//
//  Logo.swift
//  Instat
//
//  Created by Tilek Sulaymanbekov on 25/6/22.
//

import Foundation

struct Logo: Codable {
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case url = "href"
    }
}
