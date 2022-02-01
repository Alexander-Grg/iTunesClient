//
//  SearchSongsViewInput.swift
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
    func throbber(show: Bool)
}

protocol SearchSongsViewOutput: AnyObject {
    func viewDidSearch(with query: String)
    func viewDidSelectApp(_ app: ITunesSong)
}

final class SearchSongsPresenter {
    
    weak var viewInput: (UIViewController & SearchSongsViewInput)?
    
    private let searchService = ITunesSearchService()
    
    private func requestApps(with query: String) {
        self.searchService.getSongs(forQuery: query) { [weak self] result in
            guard let self = self else { return }
            self.viewInput?.throbber(show: false)
            result
                .withValue { songs in
                    guard !songs.isEmpty else {
                        self.viewInput?.showNoResults()
                        return
                    }
                    self.viewInput?.hideNoResults()
                    self.viewInput?.searchResults = songs
                }
                .withError {
                    self.viewInput?.showError(error: $0)
                }
        }
    }
    private func openAppDetails(with song: ITunesSong) {
        let songsDetailViewController = SongsDetailViewController(songs: song)
        
        self.viewInput?.navigationController?.pushViewController(songsDetailViewController, animated: true)
    }
}

extension SearchSongsPresenter: SearchSongsViewOutput {
    
    func viewDidSearch(with query: String) {
        self.viewInput?.throbber(show: true)
        self.requestApps(with: query)
    }
    
    func viewDidSelectApp(_ songs: ITunesSong) {
        self.openAppDetails(with: songs)
    }
}
