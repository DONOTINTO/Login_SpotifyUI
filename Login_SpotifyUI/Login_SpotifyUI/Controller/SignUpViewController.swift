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
        
        signUpView.signUpButton.addTarget(self, action: #selector(signUpButtonClicked), for: .touchUpInside)
        
        navigationController?.topViewController?.title = "회원가입"
        navigationController?.navigationBar.topItem?.title = ""
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    func makeUI() {
        signUpView.snp.makeConstraints {
            $0.edges.equalTo(self.view.safeAreaLayoutGuide.snp.edges)
        }
    }
    
    func makeRandomKey() -> Int {
        let key = Int.random(in: 1 ... 99999)
        return key
    }
    
    func isAvailableID(_ id: String) -> Bool {
        let duplicationID = RegisterManager.shared.registerList.filter { $0.identification == id }
        
        if id == "" {
            signUpView.identificationTextField.placeholder = "아이디를 입력해주세요."
            return false
        } else if !duplicationID.isEmpty {
            signUpView.identificationTextField.placeholder = "중복된 아이디입니다."
        } else {
            signUpView.identificationTextField.placeholder = ""
        }
        
        return duplicationID.isEmpty
    }
    
    @objc func signUpButtonClicked() {
        guard let identification = signUpView.identificationTextField.text else { return }
        guard let password = signUpView.passwordTextField.text else { return }
        guard let phone = signUpView.phoneTextField.text else { return }
        
        if !isAvailableID(identification) { return }
        
        let keyNumber = makeRandomKey()
        let register = Register(identification: identification, password: password, phone: phone, keyNumber: keyNumber)
        
        RegisterManager.shared.registerList.append(register)

        let alertVC = SuccessAlertViewController()
        alertVC.modalPresentationStyle = .overCurrentContext
        
        present(alertVC, animated: true)
    }
}
