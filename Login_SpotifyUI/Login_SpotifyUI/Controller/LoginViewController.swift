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
    
    func isAvailableLogin(id: String, password: String) -> Bool {
        if id.isEmpty {
            loginView.identificationTextField.placeholder = "아이디를 입력해주세요."
            return false
        }
        
        let register = RegisterManager.shared.registerList.filter({ $0.identification == id })
        
        if register.isEmpty {
            loginView.identificationTextField.placeholder = "존재하지 않는 아이디입니다."
            return false
        }
        
        if register.first?.password != password {
            loginView.identificationTextField.placeholder = ""
            loginView.passwordTextField.placeholder = "비밀번호가 일치하지 않습니다."
            return false
        }
        
        return true
    }
    
    func isCollectPassword(id: String, password: String) -> Bool {
        let registerInfo = RegisterManager.shared.registerList.filter { $0.identification == id }.first
        guard let registerInfo = registerInfo else { return false }
        
        if registerInfo.password == password { return true}
        
        return false
    }
    
    @objc func loginButtonClicked() {
        animateView(viewToAnimate: loginView.loginButton)
        guard let id = loginView.identificationTextField.text else { return }
        guard let password = loginView.passwordTextField.text else { return }
        
        if isAvailableLogin(id: id, password: password) {
            navigationController?.popViewController(animated: true)
        }
    }
}
