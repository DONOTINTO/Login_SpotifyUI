//
//  LoginViewController.swift
//  Login_SpotifyUI
//
//  Created by 이중엽 on 2023/04/11.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    let loginView = LoginView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        makeUI()
    }
    
    func initialSetup() {
        self.view.addSubview(loginView)
        loginView.loginButton.addTarget(self, action: #selector(loginButtonClicked), for: .touchUpInside)
        
        navigationController?.topViewController?.title = "로그인하기"
        navigationController?.navigationBar.topItem?.title = ""
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    func makeUI() {
        loginView.snp.makeConstraints {
            $0.edges.equalTo(self.view.safeAreaLayoutGuide.snp.edges)
        }
    }
    
    @objc func loginButtonClicked() {
        animateView(viewToAnimate: loginView.loginButton)
    }
}
