//
//  AppDetailDescriptionView.swift
//  iTunesClient
//
//  Created by Alexander Grigoryev on 01.02.2022.
//

import UIKit

protocol DetailViewDelegate: AnyObject {
    func openTap(isTapped: Bool)
}

final class AppDetailDescriptionView: UIView {
    
    // MARK: - Subviews
    private (set) lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.textColor = .black
        label.text = "What's New"
        
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
        label.textAlignment = .left
        label.numberOfLines = 4
        
        return label }()
    
    private (set) lazy var versionHistoryButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Version History", for: .normal)
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        button.layer.cornerRadius = 16.0
        
        return button }()
    
    private (set) lazy var lastUpdateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.textColor = .systemGray
        label.lineBreakMode = .byCharWrapping
        
        return label }()
    
    private(set) lazy var extendButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(self.tapHandler), for: .touchUpInside)
        button.setTitle("...show more", for: .normal)
        
        return button
    }()
    
    weak var delegate: DetailViewDelegate?
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupConstraints()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupConstraints()
    }
    
    // MARK: - UI
    private func setupConstraints() {
        self.addSubview(self.titleLabel)
        self.addSubview(self.versionLabel)
        self.addSubview(self.descriptionLabel)
        self.addSubview(self.versionHistoryButton)
        self.addSubview(self.lastUpdateLabel)
        self.addSubview(self.extendButton)
        NSLayoutConstraint.activate([
            self.titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,
                                                 constant: 5.0),
            self.titleLabel.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor,
                                                  constant: 16.0),
            self.titleLabel.bottomAnchor.constraint(equalTo: self.versionLabel.topAnchor, constant: -5),
            self.titleLabel.centerYAnchor.constraint(equalTo: self.versionHistoryButton.centerYAnchor),
            
            self.versionHistoryButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,
                                                           constant: 5.0),
            self.versionHistoryButton.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor,
                                                             constant: -15.0),
            self.versionHistoryButton.bottomAnchor.constraint(equalTo: self.lastUpdateLabel.topAnchor, constant: -5),
            
            self.descriptionLabel.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor,
                                                        constant: 10),
            self.descriptionLabel.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor,
                                                         constant: -10),
            self.descriptionLabel.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor,
                                                          constant: -10),
            
            self.versionLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor),
            self.versionLabel.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor,
                                                    constant: 16.0),
            self.versionLabel.bottomAnchor.constraint(equalTo: self.descriptionLabel.topAnchor),
            
            self.lastUpdateLabel.topAnchor.constraint(equalTo: self.versionHistoryButton.bottomAnchor),
            self.lastUpdateLabel.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -5),
            self.lastUpdateLabel.bottomAnchor.constraint(equalTo: self.descriptionLabel.topAnchor),
            
            self.extendButton.topAnchor.constraint(equalTo: self.lastUpdateLabel.bottomAnchor,
                                                   constant: 100),
            self.extendButton.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor),
            self.extendButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
            
        ])
    }
    
    @objc private func tapHandler() {
        self.delegate?.openTap(isTapped: true)
    }
}
