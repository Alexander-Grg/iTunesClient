//
//  SongsDescriptionViewController.swift
//  iTunesClient
//
//  Created by Alexander Grigoryev on 01.02.2022.
//

import UIKit
import Foundation

final class SongsDescriptionViewController: UIViewController {
    
    private let songs: ITunesSong
    
    private var songsDetailDescriptionView: SongsDetailDescriptionView {
        return self.view as! SongsDetailDescriptionView
    }
    
//    MARK: - Init
    init(songs: ITunesSong) {
        self.songs = songs
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        self.view = SongsDetailDescriptionView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fillData()
    }

    private func fillData() {
        self.songsDetailDescriptionView.versionLabel.text = songs.collectionName
        self.songsDetailDescriptionView.descriptionLabel.text = "app.releaseNotes"
        self.songsDetailDescriptionView.lastUpdateLabel.text = "NIL"
    }
}
