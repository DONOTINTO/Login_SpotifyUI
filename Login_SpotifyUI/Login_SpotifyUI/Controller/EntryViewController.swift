//
//  EntryViewController.swift
//  Login_SpotifyUI
//
//  Created by 이중엽 on 2023/04/09.
//

import UIKit
import SnapKit
import RealmSwift

class EntryViewController: UIViewController {
    let entryView = EntryView()
    var realm: Realm?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialSetup()
        makeUI()
        
        #if DEBUG
      
        entryView.testInitialSetup()
        entryView.testMakeUI()

        #endif
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
        let signUpVC: SignUpViewController = {
            let vc = SignUpViewController()
            vc.realm = self.realm
            return vc
        }()
        navigationController?.pushViewController(signUpVC, animated: true)
    }
    
    @objc func loginButtonClicked(sender: UIButton) {
        animateView(viewToAnimate: sender)
        let loginVC: LoginViewController = {
            let vc = LoginViewController()
            vc.realm = self.realm
            return vc
        }()
        navigationController?.pushViewController(loginVC, animated: true)
    }
    
    @objc func testButtonClicked(sender: UIButton) {
        guard let realm = realm else { return }
        let testVC = HomeViewController()
        testVC.realm = realm
        testVC.modalPresentationStyle = .fullScreen
        present(testVC, animated: true)
    }
}

