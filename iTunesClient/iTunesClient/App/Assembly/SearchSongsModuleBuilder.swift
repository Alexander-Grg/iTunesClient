//
//  SearchSongsModuleBuilder.swift
//  iTunesClient
//
//  Created by Alexander Grigoryev on 6/15/22.
//

import UIKit

final class SearchSongsModuleBuilder {
    
    static func build() -> (UIViewController & SearchSongsViewInput) {
        let presenter = SearchSongsPresenter()
        let viewController = SongsSearchViewController(presenter: presenter)
        presenter.viewInput = viewController
        
        return viewController
    }
}

