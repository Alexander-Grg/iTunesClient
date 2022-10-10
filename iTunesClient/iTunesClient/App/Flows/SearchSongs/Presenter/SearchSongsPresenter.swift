//
//  SearchSongsPresenter.swift
//  iTunesClient
//
//  Created by Alexander Grigoryev on 01.02.2022.
//

import Foundation
import UIKit

protocol SearchSongsViewInput: AnyObject {
    var searchResults: [ITunesSong] { get set }
    func showError(error: Error)
    func showNoResults()
    func hideNoResults()
    func showIndicator(show: Bool)
    func reloadView()
    func isResultEmptyCheck()
}

protocol SearchSongsViewOutput: AnyObject {
    func viewDidSearch(with query: String)
    func viewDidSelectApp(_ app: ITunesSong)
    func viewDidLoaded()
}

final class SearchSongsPresenter {
    
    weak var viewInput: (UIViewController & SearchSongsViewInput)?
    
    private let searchService = ITunesSearchService()
    
    private func requestApps(with query: String) {
        self.searchService.getSongs(forQuery: query) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let songs):
                self.viewInput?.showIndicator(show: false)
                guard !songs.isEmpty else {
                    self.viewInput?.showNoResults()
                    return
                }
                self.viewInput?.hideNoResults()
                self.viewInput?.searchResults = songs
            case .failure(let error):
                self.viewInput?.showIndicator(show: false)
                self.viewInput?.showError(error: error)
            }
        }
    }
    private func openAppDetails(with song: ITunesSong) {
        let songsDetailViewController = SongsDetailViewController(songs: song)
        
        self.viewInput?.navigationController?.pushViewController(songsDetailViewController, animated: true)
    }
}

extension SearchSongsPresenter: SearchSongsViewOutput {
    
    func viewDidLoaded() {
        self.viewInput?.isResultEmptyCheck()
    }
    
    func viewDidSearch(with query: String) {
        self.viewInput?.showIndicator(show: true)
        self.requestApps(with: query)
        self.viewInput?.reloadView()
    }
    
    func viewDidSelectApp(_ songs: ITunesSong) {
        self.openAppDetails(with: songs)
    }
}
