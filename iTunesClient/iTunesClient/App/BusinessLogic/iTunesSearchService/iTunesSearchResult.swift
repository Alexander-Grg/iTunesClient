//
//  iTunesSearchResult.swift
//  iTunesClient
//
//  Created by Alexander Grigoryev on 30.01.2022.
//

import Foundation

struct ITunesSearchResult<Element: Codable>: Codable {
    let resultCount: Int
    let results: [Element]
}
