//
//  ScreenshotsControl.swift
//  iTunesClient
//
//  Created by Alexander Grigoryev on 30.05.2022.
//

import UIKit

class ScaledHeightImageView: UIImageView {

    override var intrinsicContentSize: CGSize {

        if let myImage = self.image {
            let myImageWidth = myImage.size.width
            let myImageHeight = myImage.size.height
            let myViewWidth = self.frame.size.width

            let ratio = myViewWidth/myImageWidth
            let scaledHeight = myImageHeight * ratio

            return CGSize(width: myViewWidth, height: scaledHeight)
        }

        return CGSize(width: -1.0, height: -1.0)
    }

}

final class PageVC: UIViewController {
    
    var imageSC: ScaledHeightImageView = {
        var image = ScaledHeightImageView()
        image.contentMode = .scaleAspectFit
//        image.layoutIfNeeded()
        
        return image
    }()
    
    var page: Pages
    var images: [String] = []
    let app: ITunesApp
    
    init(with page: Pages, app: ITunesApp, currentPage: Int) {
        self.page = page
        self.app = app
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadImage()
        self.setupView()
        
    }
    
    private func setupView() {
        
        self.imageSC.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.imageSC)

        NSLayoutConstraint.activate([
            self.imageSC.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.imageSC.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            self.imageSC.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            self.imageSC.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
    
    private func loadImage() {
        let loader = ImageDownloader()
        let url = self.app.screenshotUrls[page.index]
        loader.getImage(fromUrl: url) { [weak self] image, _ in
            guard let self = self else { return }
            self.imageSC.image = image
        }
    }
}
