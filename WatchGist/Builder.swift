//
//  Builder.swift
//  WatchGist
//
//  Created by Савелий Вепрев on 18.12.2019.
//  Copyright © 2019 Савелий Вепрев. All rights reserved.
//

import UIKit

protocol BuilderProtocol {
    func createGistModule(router: RouterProtocol) -> UIViewController
    func createDetailModule(gist: Gist?, router: RouterProtocol) -> UIViewController
}

class Builder: BuilderProtocol {
    func createDetailModule(gist: Gist?, router: RouterProtocol) -> UIViewController {
        let view = DetailGistViewController()
        let networkService = NetworkService()
        let presenter = DetailGistPresenter(view: view, networkSerive: networkService, router: router, gist: gist)
        
        view.presenter = presenter
        return view
    }
    
    func createGistModule(router: RouterProtocol) -> UIViewController {
        let view = GistViewController()
        let networkService = NetworkService()
        let presenter = GistPresenter(view: view, networkService: networkService, router: router)
        
        view.presenter = presenter
        return view
    }
}
