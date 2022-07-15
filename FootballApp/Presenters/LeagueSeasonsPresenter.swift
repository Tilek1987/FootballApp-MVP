//
//  LeagueSeasonsPresenter.swift
//  Instat
//
//  Created by Tilek Sulaymanbekov on 25/6/22.
//

import Foundation

protocol LeagueSeasonsViewProtocol: AnyObject {
    func success()
    func failure(error: Error)
}

protocol LeagueSeasonsViewPresenterProtocol {
    init(view: LeagueSeasonsViewProtocol, networkService: NetworkServiceProtocol, league: League, router: RouterProtocol)
    var allSeasons: AllSeasons? { get }
    var league: League? { get }
    func getAllSeasons()
    func onSeasonTap(season: Season, league: League)
}

class LeagueSeasonsPresenter: LeagueSeasonsViewPresenterProtocol {
    
    weak var view: LeagueSeasonsViewProtocol?
    let networkService: NetworkServiceProtocol!
    var router: RouterProtocol?
    var allSeasons: AllSeasons?
    var league: League?
    
    required init(view: LeagueSeasonsViewProtocol, networkService: NetworkServiceProtocol, league: League, router: RouterProtocol) {
        self.view = view
        self.networkService = networkService
        self.league = league
        self.router = router
    }
    
    func getAllSeasons() {
        guard let id = league?.id else { return }
        networkService.perform(.seasons(id: id)) { [weak self] (result: Result<AllSeasons?, Error>) in
            guard let self = self else { return }
            switch result {
            case .success(let object):
                if let obj = object {
                    self.allSeasons = obj
                    self.view?.success()
                }
            case .failure(let error):
                self.view?.failure(error: error)
            }
        }
    }
    
    func onSeasonTap(season: Season, league: League) {
        router?.showStandings(season: season, league: league)
    }
}
