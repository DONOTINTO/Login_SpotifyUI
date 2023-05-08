//
//  LoginViewController.swift
//  Login_SpotifyUI
//
//  Created by 이중엽 on 2023/04/11.
//

import UIKit
import SnapKit
import RealmSwift

enum HidePasswordState {
    case hide
    case show
}

class LoginViewController: UIViewController {
    let loginView = LoginView()
    var passwordData: String = ""
    var hidePasswordData: String = ""
    var passwordState = HidePasswordState.hide
    var realm = try! Realm()
    var realmData: RealmData?
    var loginData: LoginData?
    var registerList: [Register]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialSetup()
        makeUI()
    }
    
    func initialSetup() {
        self.view.addSubview(loginView)
        loginView.passwordTextField.delegate = self
        loginView.loginButton.addTarget(self, action: #selector(loginButtonClicked), for: .touchUpInside)
        loginView.passwordHideButton.addTarget(self, action: #selector(passwordHideButtonClicked), for: .touchUpInside)
        
        navigationController?.topViewController?.title = "로그인하기"
        navigationController?.navigationBar.topItem?.title = ""
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        realmData = RealmData(realm: self.realm)
        loginData = LoginData(realm: self.realm)
        if let realmData = self.realmData {
            registerList = realmData.fetch()
        }
    }
    
    func makeUI() {
        loginView.snp.makeConstraints {
            $0.edges.equalTo(self.view.safeAreaLayoutGuide.snp.edges)
        }
    }
    
    func isAvailableLogin(id: String, password: String) -> Bool {
        guard let registerList = registerList else { return false }
        let register = registerList.filter { $0.identification == id }
        
        if id.isEmpty {
            loginView.identificationTextField.placeholder = "아이디를 입력해주세요."
            return false
        }
        
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
        guard let registerList = registerList else { return false }
        guard let registerInfo = registerList.filter({ $0.identification == id }).first else { return false }
        
        if registerInfo.password == password { return true}
        return false
    }
    
    @objc func loginButtonClicked() {
        animateView(viewToAnimate: loginView.loginButton)
        guard let id = loginView.identificationTextField.text else { return }
        guard let password = loginView.passwordTextField.text else { return }
        guard let loginData = loginData else { return }
        guard let registerList = registerList else { return }
        let homeVC = HomeViewController()
        
        registerList.forEach {
            if $0.identification == id {
                homeVC.register = $0
            }
        }
        
        guard let register = homeVC.register else { return }
        
        if isAvailableLogin(id: id, password: password) {
            dismiss(animated: true) {
                loginData.loginUpdate(item: register, loginStatus: true)
                self.present(homeVC, animated: true)
            }
        }
    }
    
    @objc func passwordHideButtonClicked() {
        switch passwordState {
        case .hide:
            passwordState = .show
            loginView.passwordHideButton.setImage(ProjImage.eyeSlash, for: .normal)
            loginView.passwordTextField.text = passwordData
        case .show:
            passwordState = .hide
            loginView.passwordHideButton.setImage(ProjImage.eye, for: .normal)
            loginView.passwordTextField.text = hidePasswordData
        }
        reloadInputViews()
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let startStringIndex = hidePasswordData.index(hidePasswordData.startIndex, offsetBy: range.lowerBound)
        
        // 복사넣기 시 하나씩 passwordData에 대입
        if string.count > 1 {
            let input = string.map { String($0) }
            input.forEach { passwordData.append($0) }
            input.forEach { _ in hidePasswordData.append("*") }
        // delete가 아니면 문자열 추가
        } else if !string.isEmpty {
            passwordData.append(string)
            hidePasswordData.append("*")
        // 여러 문자열을 한번에 지울 때
        } else if range.length > 1 {
            let endStringIndex = hidePasswordData.index(hidePasswordData.startIndex, offsetBy: range.upperBound - 1)
            passwordData.removeSubrange(startStringIndex ... endStringIndex)
            hidePasswordData.removeSubrange(startStringIndex ... endStringIndex)
        // 그 외 delete 처리
        } else {
            passwordData.remove(at: startStringIndex)
            hidePasswordData.remove(at: startStringIndex)
        }
        
        if passwordState == .hide, !string.isEmpty {
            loginView.passwordTextField.text = hidePasswordData
            return false
        } else if passwordState == .hide, string.isEmpty {
            return true
        }
        return true
    }
}
