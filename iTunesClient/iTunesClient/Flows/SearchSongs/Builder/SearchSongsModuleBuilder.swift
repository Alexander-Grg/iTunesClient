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
        let presenter = SearchSongsPresenter()
        let viewController = SongsSearchViewController(presenter: presenter)
        presenter.viewInput = viewController
        return viewController
    }
}
