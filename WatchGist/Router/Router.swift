//
//  Router.swift
//  WatchGist
//
//  Created by Савелий Вепрев on 19.12.2019.
//  Copyright © 2019 Савелий Вепрев. All rights reserved.
//

import UIKit

protocol MainRouterProtocol {
    var navigationController: UINavigationController? { get set }
    var builder: BuilderProtocol? { get set }
}

protocol RouterProtocol: MainRouterProtocol {
    func initialViewController()
    func showDetail(gist: Gist?)
    func popToRoot()
}

class Router: RouterProtocol {
    var navigationController: UINavigationController?
    var builder: BuilderProtocol?
    
    init(navigationController: UINavigationController, builder: BuilderProtocol) {
        self.navigationController = navigationController
        self.builder = builder
    }
    
    func initialViewController() {
        if let navigationController = navigationController {
            guard let viewController = builder?.createGistModule(router: self) else { return }
            navigationController.viewControllers = [viewController]
            
        }
    }
    
    func showDetail(gist: Gist?) {
        if let navigationController = navigationController {
            guard let viewController = builder?.createDetailModule(gist: gist, router: self) else { return }
            navigationController.pushViewController(viewController, animated: true)
        }
    }
    
    func popToRoot() {
        if let navigationController = navigationController {
            navigationController.popViewController(animated: true)
        }
    }
    
    
}

