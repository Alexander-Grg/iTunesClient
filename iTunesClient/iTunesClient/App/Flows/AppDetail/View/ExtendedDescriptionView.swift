//
//  ExtendedDescriptionView.swift
//  iTunesClient
//
//  Created by Alexander Grigoryev on 1.06.2022.
//

import UIKit

final class ExtendedDescriptionView: UIView {
    
// MARK: - Properties
    
    let view = AppDetailDescriptionView()
    var isLarge = false
    
    private(set) lazy var descriptionText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.textColor = .black
        label.numberOfLines = .max
        label.sizeToFit()
        label.textAlignment = .left
        
        let gestureR = UITapGestureRecognizer(target: self, action: #selector(self.tap))
        gestureR.numberOfTapsRequired = 1
        gestureR.location(in: view)
        self.addGestureRecognizer(gestureR)
        self.isUserInteractionEnabled = true
        
        return label
    }()
    
    private(set) lazy var extendButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(self.tap), for: .touchUpInside)
        button.setTitle("...show less", for: .normal)
        
        return button
    }()
    
    weak var delegate: DetailViewDelegate?
    
// MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configureUI()
    }
    
// MARK: - Methods
    
    @objc func tap() {
        self.removeFromSuperview()
    }
    
    private func configureUI() {
        self.addSubview(self.descriptionText)
        self.addSubview(self.extendButton)
        self.settingConstraints()
    }
    
    private func settingConstraints() {
        self.descriptionText.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([

            self.descriptionText.topAnchor.constraint(equalTo: self.topAnchor),
            self.descriptionText.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            self.descriptionText.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            self.descriptionText.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            self.extendButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 180),
            self.extendButton.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor),
            self.extendButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
            
        ])
    }
    
    func configureData(_ model: ITunesApp ) {
        self.descriptionText.text = model.releaseNotes
        
        let lenght = model.releaseNotes.count
        let maxLenght = 150

        if lenght >= maxLenght {
            self.isLarge = true
        }
    }
    
}
