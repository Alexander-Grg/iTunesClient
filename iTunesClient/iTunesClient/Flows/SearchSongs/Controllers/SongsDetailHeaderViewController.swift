//
//  SongsDetailHeaderViewController.swift
//  iTunesClient
//
//  Created by Alexander Grigoryev on 01.02.2022.
//

import Foundation
import UIKit

final class SongsDetailHeaderViewController: UIViewController {
    // MARK: - Properties
    private let songs: ITunesSong
    private let imageDownloader = ImageDownloader()
    private var songsDetailHeaderView: SongsDetailHeaderView {
        return self.view as! SongsDetailHeaderView
    }
    
    // MARK: - Init
    init(songs: ITunesSong) {
        self.songs = songs
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        self.view = SongsDetailHeaderView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fillData()
    }
    // MARK: - Private
    private func fillData() {
        self.downloadImage()
        self.songsDetailHeaderView.titleLabel.text = songs.trackName
        self.songsDetailHeaderView.subtitleLabel.text = songs.artistName
        self.songsDetailHeaderView.ratingLabel.text = songs.collectionName
    }
    private func downloadImage() {
        guard let url = self.songs.artwork else { return }
        self.imageDownloader.getImage(fromUrl: url) { [weak self] (image, _) in
            self?.songsDetailHeaderView.imageView.image = image
            
        }
    }
}

