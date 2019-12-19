//
//  DetailGistPresenter.swift
//  WatchGist
//
//  Created by Савелий Вепрев on 19.12.2019.
//  Copyright © 2019 Савелий Вепрев. All rights reserved.
//

import Foundation
protocol DetailGistViewProtocol: class {
    func setGist(gist: Gist?)
}

protocol DetailGistPresenterProtocol: class {
    init(view: DetailGistViewProtocol, networkSerive: NetworkServiceProtocol, router: RouterProtocol, gist: Gist?)
    func setGist()
}

class DetailGistPresenter: DetailGistPresenterProtocol {
    weak var view: DetailGistViewProtocol?
    let networkService: NetworkServiceProtocol!
    var router: RouterProtocol?
    var gist: Gist?
    
    required init(view: DetailGistViewProtocol, networkSerive: NetworkServiceProtocol, router: RouterProtocol, gist: Gist?) {
        self.view = view
        self.networkService = networkSerive
        self.gist = gist
        self.router = router
    }
    
    func setGist() {
        self.view?.setGist(gist: gist)
    }
    
    
}
