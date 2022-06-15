//
//  DescriptionViewController.swift
//  iTunesClient
//
//  Created by Alexander Grigoryev on 01.02.2022.
//

import UIKit

final class DescriptionViewController: UIViewController {
    
    private let app: ITunesApp
    
    private var appDetailDescriptionView: AppDetailDescriptionView {
        return self.view as! AppDetailDescriptionView
    }
    
    private var extendedDescriptionView = ExtendedDescriptionView()
    
//    MARK: - Init
    init(app: ITunesApp) {
        self.app = app
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        let view2 = AppDetailDescriptionView()
        self.view = view2
        view2.delegate = self
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fillData()
        
        if self.extendedDescriptionView.isLarge {
            appDetailDescriptionView.extendButton.isHidden = false
        } else {
            appDetailDescriptionView.extendButton.isHidden = true
        }
    
    }
    
    private func fillData() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        guard let date = formatter.date(from: app.currentVersionReleaseDate) else { return }
        self.appDetailDescriptionView.versionLabel.text = "Version \(app.version)"
        self.appDetailDescriptionView.descriptionLabel.text = app.releaseNotes
        self.appDetailDescriptionView.lastUpdateLabel.text = "\(String(describing: date))"
        self.extendedDescriptionView.configureData(app)
    }
    
    private func loadExtendedDescriptionView() {
    
        
        self.view.addSubview(self.extendedDescriptionView)
        self.extendedDescriptionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.extendedDescriptionView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.extendedDescriptionView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            self.extendedDescriptionView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            self.extendedDescriptionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])

    }
}

extension DescriptionViewController: DetailViewDelegate {


    func openTap(isTapped: Bool) {
        if isTapped == true {
            self.loadExtendedDescriptionView()
        }
    }
    
}
