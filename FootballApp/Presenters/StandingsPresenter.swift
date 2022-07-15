//
//  StandingsPresenter.swift
//  Instat
//
//  Created by Tilek Sulaymanbekov on 26/6/22.
//

import Foundation

protocol StandingsViewProtocol: AnyObject {
    func success(data: AllStandings)
    func failure(error: Error)
}

protocol StandingsViewPresenterProtocol {
    init(view: StandingsViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol, league: League, season: Season)
    var league: League? { get }
    var season: Season? { get }
    func getStandings()
}

class StandingsPresenter: StandingsViewPresenterProtocol {
    
    weak var view: StandingsViewProtocol?
    let networkService: NetworkServiceProtocol!
    var router: RouterProtocol?
    var allStandings: AllStandings?
    var league: League?
    var season: Season?
    
    required init(view: StandingsViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol, league: League, season: Season) {
        self.view = view
        self.networkService = networkService
        self.router = router
        self.season = season
        self.league = league
    }
    
    func getStandings() {
        guard let id = league?.id, let year = season?.year else { return }
        networkService.perform(.standings(id: id, season: String(year))) { [weak self] (result: Result<AllStandings?, Error>) in
            guard let self = self else { return }
            switch result {
            case .success(let object):
                if let obj = object {
                    self.allStandings = obj
                    self.view?.success(data: obj)
                }
            case .failure(let error):
                self.view?.failure(error: error)
            }
        }
    }
}
