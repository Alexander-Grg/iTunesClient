//
//  AppDetailViewController.swift
//  iTunesClient
//
//  Created by Alexander Grigoryev on 30.01.2022.
//

import UIKit

final class AppDetailViewController: UIViewController {
    
    let app: ITunesApp
    
    lazy var headerViewController = AppDetailHeaderViewController(app: self.app)
    lazy var descriptionViewController = DescriptionViewController(app: self.app)
    lazy var screenshotsVC = ExtendedPhotoViewController(app: self.app)
    
    init(app: ITunesApp) {
        self.app = app
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUI()
    }
    
    private func configureUI() {
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationItem.largeTitleDisplayMode = .never
        self.addHeaderViewController()
        self.addDescriptionViewController()
        self.addScreenshotsViewController()
        
    }
    
    private func addHeaderViewController() {
        self.addChild(self.headerViewController)
        self.view.addSubview(self.headerViewController.view)
        self.headerViewController.didMove(toParent: self)
        self.headerViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.headerViewController.view.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.headerViewController.view.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            self.headerViewController.view.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        ])
    }
    
    private func addDescriptionViewController() {
        self.addChild(self.descriptionViewController)
        self.view.addSubview(self.descriptionViewController.view)
        self.descriptionViewController.didMove(toParent: self)
        self.descriptionViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.descriptionViewController.view.topAnchor.constraint(
                equalTo: self.headerViewController.view.bottomAnchor),
            self.descriptionViewController.view.leftAnchor.constraint(
                equalTo: self.view.leftAnchor),
            self.descriptionViewController.view.rightAnchor.constraint(
                equalTo: self.view.rightAnchor),
            self.descriptionViewController.view.heightAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    private func addScreenshotsViewController() {
        self.addChild(self.screenshotsVC)
        self.view.addSubview(self.screenshotsVC.view)
        self.screenshotsVC.didMove(toParent: self)
        self.screenshotsVC.view.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            self.screenshotsVC.view.topAnchor.constraint(
                equalTo: self.descriptionViewController.view.bottomAnchor,
                constant: 10),
            self.screenshotsVC.view.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            self.screenshotsVC.view.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            self.screenshotsVC.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -5)
        ])
    }
}
