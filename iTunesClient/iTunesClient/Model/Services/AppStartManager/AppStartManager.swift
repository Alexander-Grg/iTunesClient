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
        searchAppsVC.tabBarItem = UITabBarItem(title: "Search Apps", image: UIImage(systemName: "airtag"), tag: 0)
        searchSongsVC.tabBarItem = UITabBarItem(title: "Search Songs", image: UIImage(systemName: "music.note"), tag: 1)
        searchAppsVC.navigationItem.title = "iTunes"
        searchSongsVC.navigationItem.title = "iTunes"
        let controllers: [UIViewController] = [searchAppsVC, searchSongsVC]
        tabbar.viewControllers = controllers
        let navVС = self.configuredNavigationController
        navVС.setViewControllers([tabbar], animated: false)
        window?.rootViewController = navVС
        window?.makeKeyAndVisible()
    }
    
    private lazy var configuredNavigationController: UINavigationController = {
        let navVC = UINavigationController()
        navVC.navigationBar.barTintColor = UIColor.varna
        navVC.navigationBar.isTranslucent = false
        navVC.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navVC.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navVC.navigationItem.title = "iTunes"
        return navVC
    }()
    
//    private lazy var configuredTabbarController: UITabBarController = {
//        let tabbar = UITabBarController()
//        tabbar.tabBarItem = .init(title: "SearchApps", image: <#T##UIImage?#>, selectedImage: <#T##UIImage?#>)
//        return tabbar
//    }()
}

