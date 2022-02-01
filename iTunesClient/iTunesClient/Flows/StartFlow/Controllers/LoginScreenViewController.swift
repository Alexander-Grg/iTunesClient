//
//  LoginScreenViewController.swift
//  iTunesClient
//
//  Created by Alexander Grigoryev on 01.02.2022.
//

import UIKit

final class LoginScreenViewController: UIViewController {
    
    
    private var loginScreenView: LoginScreenView {
        return self.view as! LoginScreenView
    }
    
//    MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
    }
}
