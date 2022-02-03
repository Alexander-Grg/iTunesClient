//
//  SearchModuleBuilder.swift
//  iTunesClient
//
//  Created by Alexander Grigoryev on 01.02.2022.
//

import UIKit

final class SearchModuleBuilder {
    
    static func build() -> (UIViewController & SearchViewInput) {
        let router = SearchRouter()
               let interactor = SearchInteractor()
               let presenter = SearchPresenter(interactor: interactor, router: router)
               let viewController = SearchViewController(presenter: presenter)
               
               presenter.viewInput = viewController
               router.viewController = viewController
               
               return viewController
    }
}
