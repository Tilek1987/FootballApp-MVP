//
//  Array + extension.swift
//  Instat
//
//  Created by Tilek Sulaymanbekov on 26/6/22.
//

import Foundation

extension Array where Element == Stat {
    func getStatistics(type: StatType) -> String {
        return self.first { $0.type == type }?.displayValue ?? "0"
    }
}

