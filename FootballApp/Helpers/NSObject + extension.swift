//
//  NSObject + extension.swift
//  Instat
//
//  Created by Tilek Sulaymanbekov on 25/6/22.
//

import Foundation

extension NSObject {
    
    static var className: String {
        String(describing: Self.self)
    }
}
