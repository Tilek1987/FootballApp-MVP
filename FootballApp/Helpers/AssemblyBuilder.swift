//
//  Builder.swift
//  Instat
//
//  Created by Tilek Sulaymanbekov on 25/6/22.
//

import UIKit

protocol AssemblyBuilderProtocol {
    func createMainVC(router: RouterProtocol) -> UIViewController
    func createAllSeasonsVC(league: League, router: RouterProtocol) -> UIViewController
    func createAllStandingsVC(router: RouterProtocol, season: Season, league: League) -> UIViewController
}

class AssemblyBuilder: AssemblyBuilderProtocol {
    
    func createMainVC(router: RouterProtocol) -> UIViewController {
        let view = MainViewController()
        let networkService = NetworkService()
        let presenter = MainPresenter(view: view, networkService: networkService, router: router)
        view.presenter = presenter
        return view
    }
    
    func createAllSeasonsVC(league: League, router: RouterProtocol) -> UIViewController {
        let view = LeagueSeasonsViewController()
        let networkService = NetworkService()
        let presenter = LeagueSeasonsPresenter(view: view, networkService: networkService, league: league, router: router)
        view.presenter = presenter
        return view
    }
    
    func createAllStandingsVC(router: RouterProtocol, season: Season, league: League) -> UIViewController {
        let view = StandingsViewController()
        let networkService = NetworkService()
        let presenter = StandingsPresenter(view: view, networkService: networkService, router: router, league: league, season: season)
        view.presenter = presenter
        return view
    }
} 
