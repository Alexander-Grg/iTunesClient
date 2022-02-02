//
//  SongsCellModelFactory.swift.swift
//  iTunesClient
//
//  Created by Alexander Grigoryev on 01.02.2022.
//

import Foundation

struct SongsCellModel {
    let trackName: String
    let artistName: String?
    let collectionName: String?
    let artwork: String?
}

final class SongsCellModelFactory {
    
    static func cellModel(from model: ITunesSong) -> SongsCellModel {
        return SongsCellModel(trackName: model.trackName,
                              artistName: model.artistName,
                              collectionName: model.collectionName,
                              artwork: model.artwork)
    }
}
