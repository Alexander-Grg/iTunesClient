//
//  AppStartManager.swift
//  iTunesClient
//
//  Created by Alexander Grigoryev on 30.01.2022.
//

import UIKit

final class AppStartManager {
    
    var window: UIWindow?
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        let tabbar = UITabBarController()
        let searchAppsVC = SearchModuleBuilder.build()
        let searchSongsVC = SearchSongsModuleBuilder.build()
        let navVС = self.configuredNavigationController
        navVС.setViewControllers([tabbar], animated: false)
        window?.rootViewController = navVС
        window?.makeKeyAndVisible()
        
        searchAppsVC.tabBarItem = UITabBarItem(title: "Search Apps", image: UIImage(systemName: "airtag"), tag: 0)
        searchSongsVC.tabBarItem = UITabBarItem(title: "Search Songs", image: UIImage(systemName: "music.note"), tag: 1)
        tabbar.title = "iTunes"
        let controllers: [UIViewController] = [searchAppsVC, searchSongsVC]
        tabbar.viewControllers = controllers
    }
    
    private lazy var configuredNavigationController: UINavigationController = {
        let navVC = UINavigationController()
        navVC.navigationBar.isTranslucent = false
        navVC.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navVC.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        return navVC
    }()
}
