//
//  SearchInteractor.swift
//  iTunesClient
//
//  Created by Alexander Grigoryev on 03.02.2022.
//

import UIKit
import Alamofire

protocol SearchInteractorInput {
    
    func requestApps(with query: String, completion: @escaping (Result<[ITunesApp]>) -> Void)
}

final class SearchInteractor: SearchInteractorInput {
    
    private let searchService = ITunesSearchService()
    
    func requestApps(with query: String, completion: @escaping (Result<[ITunesApp]>) -> Void) {
        self.searchService.getApps(forQuery: query, then: completion)
    }
}
