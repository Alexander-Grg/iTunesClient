//
//  SongsInteractor.swift
//  iTunesClient
//
//  Created by Alexander Grigoryev on 03.02.2022.
//

import UIKit
import Alamofire

protocol SearchSongsInteractorInput {
    
    func requestSongs(with query: String, completion: @escaping (Result<[ITunesSong]>) -> Void)
}

final class SearchSongsInteractor: SearchSongsInteractorInput {
    
    private let searchService = ITunesSearchService()
    
    func requestSongs(with query: String, completion: @escaping (Result<[ITunesSong]>) -> Void) {
        self.searchService.getSongs(forQuery: query, completion: completion)
    }
}
