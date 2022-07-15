//
//  Router.swift
//  Instat
//
//  Created by Tilek Sulaymanbekov on 25/6/22.
//

import Foundation

enum Router {
    case allLeagues
    case detail(id: String)
    case seasons(id: String)
    case standings(id: String, season: String)
    
    var scheme: String {
        return "https"
    }
    
    var host: String {
        return "api-football-standings.azharimm.site"
    }
    
    var path: String {
        switch self {
        case .allLeagues:
            return "/leagues"
        case .detail(id: let id):
            return "/leagues/\(id)"
        case let .seasons(id):
            return "/leagues/\(id)/seasons"
        case let .standings(id, _):
            return "/leagues/\(id)/standings"
        }
    }
    
    var queryParams: [String : String] {
        switch self {
        case let .standings(_, season):
            return [
                "season": season
            ]
        default:
            return [:]
        }
    }
    
    var headers: [String : String] {
        return ["Content-Type": "application/json"]
    }
    
    var requestMethod: HTTPMethod {
        return .GET
    }
}
