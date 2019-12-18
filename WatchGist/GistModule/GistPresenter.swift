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
    init(view: GistViewProtocol, networkService: NetworkServiceProtocol)
    func getGists()
    var gists: [Gist]? { get set }
}

class GistPresenter: GistViewPresenterProtocol {
    
    weak var view: GistViewProtocol?
    let networkService: NetworkServiceProtocol!
    var gists: [Gist]?
    var page: Int = 0
    var perPage: Int = 50
    
    required init(view: GistViewProtocol, networkService: NetworkServiceProtocol) {
        self.view = view
        self.networkService = networkService
        getGists()
    }
    func getGists() {
        networkService.getGists(page: page, perPage: perPage) { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let gists):
                    self.gists = gists
                    self.view?.success()
                case .failure(let error):
                    self.view?.failure(error: error)
                }                
            }
        }
    }
    
    
}
