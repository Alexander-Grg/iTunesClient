//
//  LoginScreenView.swift
//  iTunesClient
//
//  Created by Alexander Grigoryev on 01.02.2022.
//

import UIKit

final class LoginScreenView: UIView {
    
//    MARK: - Subviews
    let loginButton = UIButton()
    
//    MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //    MARK: - setting UI
    
    private func configureUI() {
        self.addloginButton()
        self.setupConstraints()
    }
    
    private func addloginButton() {
        self.loginButton.translatesAutoresizingMaskIntoConstraints = false
        self.loginButton.setTitle("Log in", for: .normal)
        self.loginButton.backgroundColor = .systemGray
        self.loginButton.setTitleColor(.black, for: .normal)
        self.loginButton.addSubview(self.loginButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.loginButton.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            self.loginButton.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor)
        ])
    }
    
}
