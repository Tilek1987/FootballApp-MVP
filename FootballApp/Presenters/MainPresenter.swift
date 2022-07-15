//
//  MainPresenter.swift
//  Instat
//
//  Created by Tilek Sulaymanbekov on 25/6/22.
//

import Foundation

protocol MainViewProtocol: AnyObject {
    func success()
    func failure(error: Error)
}

protocol MainViewPresenterProtocol {
    init(view: MainViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol)
    func getAllLeagues()
    func onTapLeague(league: League)
    var allLeagues: AllLeagues? { get }
}

class MainPresenter: MainViewPresenterProtocol {
    
    weak var view: MainViewProtocol?
    var router: RouterProtocol?
    let networkService: NetworkServiceProtocol!
    var allLeagues: AllLeagues?
    
    required init(view: MainViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol) {
        self.view = view
        self.networkService = networkService
        self.router = router
        getAllLeagues()
    }
    
    func getAllLeagues() {
        networkService.perform(.allLeagues) { [weak self] (result: Result<AllLeagues?, Error>) in
            guard let self = self else { return }
            switch result {
            case .success(let object):
                if let obj = object {
                    self.allLeagues = obj
                    self.view?.success()
                }
            case .failure(let error):
                self.view?.failure(error: error)
            }
        }
    }
    
    func onTapLeague(league: League) {
        router?.showAllSeasons(league: league)
    }
}
