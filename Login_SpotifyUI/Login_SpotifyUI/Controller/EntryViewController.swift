//
//  EntryViewController.swift
//  Login_SpotifyUI
//
//  Created by 이중엽 on 2023/04/09.
//

import UIKit
import SnapKit

class EntryViewController: UIViewController {
    let entryView = EntryView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialSetup()
        makeUI()
    }
    
    func initialSetup() {
        view.addSubview(entryView)
        entryView.signUpButton.addTarget(self, action: #selector(signUpButtonClicked), for: .touchUpInside)
        entryView.loginButton.addTarget(self, action: #selector(loginButtonClicked), for: .touchUpInside)
    }
    
    func makeUI() {
        entryView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide.snp.edges)
        }
    }
    
    @objc func signUpButtonClicked(sender: UIButton) {
        animateView(viewToAnimate: sender)
        navigationController?.pushViewController(SignUpViewController(), animated: true)
    }
    
    @objc func loginButtonClicked(sender: UIButton) {
        animateView(viewToAnimate: sender)
        navigationController?.pushViewController(LoginViewController(), animated: true)
    }
    
    @objc func testButtonClicked(sender: UIButton) {
        let testVC = HomeViewController()
        testVC.modalPresentationStyle = .fullScreen
        present(testVC, animated: true)
    }
}

