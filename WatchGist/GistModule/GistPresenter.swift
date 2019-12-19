//
//  GistPresenter.swift
//  WatchGist
//
//  Created by Савелий Вепрев on 18.12.2019.
//  Copyright © 2019 Савелий Вепрев. All rights reserved.
//

import Foundation

protocol GistViewProtocol: class {
    func success()
    func failure(error: Error)
}

protocol GistViewPresenterProtocol: class {
    init(view: GistViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol)
    func getGists()
    var gists: [Gist]? { get set }
    func tapOnTheGist(gist: Gist?)
}

class GistPresenter: GistViewPresenterProtocol {
    
    weak var view: GistViewProtocol?
    let networkService: NetworkServiceProtocol!
    var router: RouterProtocol?
    var gists: [Gist]?
    var changeGist: [Gist] = []
    var page: Int = 0
    var perPage: Int = 20
    
    required init(view: GistViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol) {
        self.view = view
        self.networkService = networkService
        self.router = router

        getGists()
    }
    func tapOnTheGist(gist: Gist?) {
        router?.showDetail(gist: gist)
    }
    func pageCount() {
        page+=1
    }
    func getGists() {
        networkService.getGists(page: page, perPage: perPage) { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let gists):
                    gists?.forEach {
                        self.changeGist.append($0)
                    }
                    self.gists = self.changeGist
                    self.view?.success()
                    self.pageCount()
                case .failure(let error):
                    self.view?.failure(error: error)
                }                
            }
        }
    }
    
    
}
