//
//  SearchViewInput.swift
//  iTunesClient
//
//  Created by Alexander Grigoryev on 01.02.2022.
//

import Foundation
import UIKit

protocol SearchViewInput: AnyObject {
    var searchResults: [ITunesApp] { get set }
    func showError(error: Error)
    func showNoResults()
    func hideNoResults()
    func throbber(show: Bool)
}

protocol SearchViewOutput: AnyObject {
    func viewDidSearch(with query: String)
    func viewDidSelectApp(_ app: ITunesApp)
}

final class SearchPresenter {
    
    weak var viewInput: (UIViewController & SearchViewInput)?
    
    let interactor: SearchInteractorInput
    
    let router: SearchRouterInput
    
//    private let searchService = ITunesSearchService()
    
    init(interactor: SearchInteractorInput, router: SearchRouterInput) {
        self.interactor = interactor
        self.router = router
    }
    
    private func openAppDetails(with app: ITunesApp) {
        let appDetailViewController = AppDetailViewController(app: app)
        self.viewInput?.navigationController?.pushViewController(appDetailViewController, animated: true)
    }
}

extension SearchPresenter: SearchViewOutput {
    
    func viewDidSearch(with query: String) {
        self.viewInput?.throbber(show: true)
        interactor.requestApps(with: query) { [weak self] result in
            guard let self = self else { return }
            self.viewInput?.throbber(show: false)
            switch result {
            case .success(let apps):
                guard !apps.isEmpty else {
                    self.viewInput?.showNoResults()
                    return
                }
                self.viewInput?.hideNoResults()
                self.viewInput?.searchResults = apps
                
            case .failure(let error):
                self.viewInput?.showError(error: error)
            }
        }
    }
    
    func viewDidSelectApp(_ app: ITunesApp) {
        self.router.openDetails(for: app)
    }
}
