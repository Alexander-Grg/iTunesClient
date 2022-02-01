//
//  AppDetailDescriptionView.swift
//  iTunesClient
//
//  Created by Alexander Grigoryev on 01.02.2022.
//

import UIKit

final class AppDetailDescriptionView: UIView {
    
//    MARK: - Subviews
    private (set) lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.textColor = .black
        label.text = "What's new"
        return label }()
    
    private (set) lazy var versionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.textColor = .systemGray
        return label }()
    
    private (set) lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.textColor = .black
        label.numberOfLines = .max
        label.sizeToFit()
        label.textAlignment = .left
        return label }()
    
    private (set) lazy var versionHistoryButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Version history", for: .normal)
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        button.layer.cornerRadius = 16.0
        return button }()
    
    private (set) lazy var lastUpdateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.textColor = .systemGray
        return label }()
    
//    MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupConstraints()
    }
    
//    MARK: - UI
    private func setupConstraints() {
        self.addSubview(self.titleLabel)
        self.addSubview(self.versionLabel)
        self.addSubview(self.descriptionLabel)
        self.addSubview(self.versionHistoryButton)
        self.addSubview(self.lastUpdateLabel)
        
        NSLayoutConstraint.activate([
            
            self.titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor , constant: 20.0),
            self.titleLabel.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: 270.0),
            self.titleLabel.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 16.0),
            self.versionLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 10.0),
            self.versionLabel.leftAnchor.constraint(equalTo: self.titleLabel.leftAnchor),
            self.versionLabel.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: 270.0),
            self.descriptionLabel.topAnchor.constraint(equalTo: self.versionLabel.bottomAnchor, constant: 10.0),
            self.descriptionLabel.leftAnchor.constraint(equalTo: self.titleLabel.leftAnchor),
            self.descriptionLabel.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: 25.0),
            self.versionHistoryButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20.0),
            self.versionHistoryButton.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: 25.0),
            self.versionHistoryButton.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 270.0),
            self.lastUpdateLabel.topAnchor.constraint(equalTo: self.versionHistoryButton.bottomAnchor, constant: 10.0),
            self.lastUpdateLabel.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: 25.0),
            self.lastUpdateLabel.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 270.0)
        ])
    }
    
}
