//
//  SongsRouter.swift
//  iTunesClient
//
//  Created by Alexander Grigoryev on 03.02.2022.
//

import UIKit

protocol SearchSongsRouterInput {
    func openDetails(for songs: ITunesSong)
//    func openSongInITunes(_ songs: ITunesSong)
}

final class SearchSongsRouter: SearchSongsRouterInput {

    weak var viewController: UIViewController?
    
    func openDetails(for songs: ITunesSong) {
        let songsDetaillViewController = SongsDetailViewController(songs: songs)
        self.viewController?.navigationController?.pushViewController(songsDetaillViewController, animated: true)
    }
    
//    func openSongInITunes(_ songs: ITunesSong) {
//        guard let urlString = songs.trackName, let url = URL(string: urlString) else {
//            return
//        }
//        UIApplication.shared.open(url, options: [:], completionHandler: nil)
//    }
}

