//
//  Builder.swift
//  WatchGist
//
//  Created by Савелий Вепрев on 18.12.2019.
//  Copyright © 2019 Савелий Вепрев. All rights reserved.
//

import UIKit

protocol BuilderProtocol {
    static func createGistModule() -> UIViewController
    static func createDetailModule(gist: Gist?) -> UIViewController
}

class Builder: BuilderProtocol {
    static func createDetailModule(gist: Gist?) -> UIViewController {
        let view = DetailGistViewController()
        let networkService = NetworkService()
        let presenter = DetailGistPresenter(view: view, networkSerive: networkService, gist: gist)
        
        view.presenter = presenter
        return view
    }
    
    static func createGistModule() -> UIViewController {
        let view = GistViewController()
        let networkService = NetworkService()
        let presenter = GistPresenter(view: view, networkService: networkService)
        
        view.presenter = presenter
        return view
    }
    
    
}
