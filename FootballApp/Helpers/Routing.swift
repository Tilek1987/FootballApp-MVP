//
//  Routing.swift
//  Instat
//
//  Created by Tilek Sulaymanbekov on 26/6/22.
//

import UIKit

protocol RouterMainProtocol: AnyObject {
    var navigationController: UINavigationController? { get set }
    var assemblyBuilder: AssemblyBuilderProtocol? { get set }
}

protocol RouterProtocol: RouterMainProtocol {
    func initialViewController()
    func showAllSeasons(league: League)
    func showStandings(season: Season, league: League)
    func popToRoot()
}

class Routing: RouterProtocol {
    
    var navigationController: UINavigationController?
    var assemblyBuilder: AssemblyBuilderProtocol?
    
    init(navigationController: UINavigationController, assemblyBuilder: AssemblyBuilderProtocol) {
        self.navigationController = navigationController
        self.assemblyBuilder = assemblyBuilder
    }
    
    func initialViewController() {
        if let navC = navigationController {
            guard let mainVC = assemblyBuilder?.createMainVC(router: self) else { return }
            navC.viewControllers = [mainVC]
        }
    }
    
    func showAllSeasons(league: League) {
        if let navC = navigationController {
            guard let allSeasonsVC = assemblyBuilder?.createAllSeasonsVC(league: league, router: self) else { return }
            navC.pushViewController(allSeasonsVC, animated: true)
        }
    }
    
    func showStandings(season: Season, league: League) {
        if let navC = navigationController {
            guard let allStandingsVC = assemblyBuilder?.createAllStandingsVC(router: self, season: season, league: league) else { return }
            navC.pushViewController(allStandingsVC, animated: true)
        }
    }
    
    func popToRoot() {
        if let navC = navigationController {
            navC.popViewController(animated: true)
        }
    }
}
