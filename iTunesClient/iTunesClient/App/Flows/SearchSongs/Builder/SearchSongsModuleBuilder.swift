//
//  SearchSongsModuleBuilder.swift
//  iTunesClient
//
//  Created by Alexander Grigoryev on 01.02.2022.
//

import Foundation
import UIKit

final class SearchSongsModuleBuilder {
    
    static func build() -> (UIViewController & SearchSongsViewInput) {
        let router = SearchSongsRouter()
        let interactor = SearchSongsInteractor()
        let presenter = SearchSongsPresenter(interactor: interactor, router: router)
        let viewController = SongsSearchViewController(presenter: presenter)
        
        presenter.viewInput = viewController
        router.viewController = viewController
        
        return viewController
    }
}
