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
        self.view = AppDetailDescriptionView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fillData()
    }
    
//    let dateString = "2020-03-09T11:53:39.474Z"
//    let formatter = ISO8601DateFormatter()
//    formatter.formatOptions = [
//        .withInternetDateTime,
//        .withFractionalSeconds,
//        .withColonSeparatorInTime,
//        .withDashSeparatorInDate,
//        .withTimeZone]
//    if let date = formatter.date(from: dateString) {
//        print(date)
//    } else {
//        print("Could not convert date")
//    }
    private func fillData() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        guard let date = formatter.date(from: app.currentVersionReleaseDate) else { return }
        self.appDetailDescriptionView.versionLabel.text = app.version
        self.appDetailDescriptionView.descriptionLabel.text = app.releaseNotes
        self.appDetailDescriptionView.lastUpdateLabel.text = "\(String(describing: date))"
    }
}
