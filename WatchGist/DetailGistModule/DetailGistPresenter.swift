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
    init(view: DetailGistViewProtocol, networkSerive: NetworkServiceProtocol, gist: Gist?)
    func setGist()
}

class DetailGistPresenter: DetailGistPresenterProtocol {
    weak var view: DetailGistViewProtocol?
    let networkService: NetworkServiceProtocol!
    var gist: Gist?
    
    required init(view: DetailGistViewProtocol, networkSerive: NetworkServiceProtocol, gist: Gist?) {
        self.view = view
        self.networkService = networkSerive
        self.gist = gist
    }
    
    func setGist() {
        self.view?.setGist(gist: gist)
    }
    
    
}
