//
//  AppCellModel.swift
//  iTunesClient
//
//  Created by Alexander Grigoryev on 30.01.2022.
//

import Foundation

struct AppCellModel {
    let title: String
    let subtitle: String?
    let rating: String?
    let avatar: String?
}

final class AppCellModelFactory {
    
    static func cellModel(from model: ITunesApp) -> AppCellModel {
        return AppCellModel(title: model.appName,
                            subtitle: model.company,
                            rating: model.averageRating.flatMap { "\($0)" },
                            avatar: model.iconUrl)
    }
}
