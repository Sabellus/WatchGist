//
//  AppDelegate.swift
//  WatchGist
//
//  Created by Савелий Вепрев on 17.12.2019.
//  Copyright © 2019 Савелий Вепрев. All rights reserved.
//

import UIKit
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        let mainVC = Builder.createGistModule()
        let navBar = UINavigationController(rootViewController: mainVC)
        window?.rootViewController = navBar
        window?.makeKeyAndVisible()
        return true
    }

}

