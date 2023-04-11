//
//  SignUpViewController.swift
//  Login_SpotifyUI
//
//  Created by 이중엽 on 2023/04/10.
//

import UIKit
import SnapKit

class SignUpViewController: UIViewController {
    let signUpView = SignUpView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initialSetup()
        makeUI()
    }
    
    func initialSetup() {
        self.view.addSubview(signUpView)
        self.title = "회원가입"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    func makeUI() {
        signUpView.snp.makeConstraints {
            $0.edges.equalTo(self.view.safeAreaLayoutGuide.snp.edges)
        }
    }
}
