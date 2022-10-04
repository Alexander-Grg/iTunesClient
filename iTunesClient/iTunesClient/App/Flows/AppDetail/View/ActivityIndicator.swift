//
//  ActivityIndicator.swift
//  iTunesClient
//
//  Created by Alexander Grigoryev on 30.01.2022.
//

import UIKit

final class ActivityIndicator: UIView {
    
    private(set) lazy var indicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .medium)
        indicator.hidesWhenStopped = true
        indicator.translatesAutoresizingMaskIntoConstraints = false
        
        return indicator
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configureUI()
    }
    
    // MARK: - UI
    
    private func configureUI() {
        self.backgroundColor = .white
        self.addIndicator()
//        self.setupConstraints()
    }
    
    private func addIndicator() {
        self.addSubview(self.indicator)
    }
    
//    private func setupConstraints() {
//        NSLayoutConstraint.activate([
//            self.indicator.centerXAnchor.constraint(equalTo: self.centerXAnchor),
//            self.indicator.centerYAnchor.constraint(equalTo: self.centerYAnchor)
//            ])
//    }
}
