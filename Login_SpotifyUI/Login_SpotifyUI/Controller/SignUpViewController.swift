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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func initialSetup() {
        self.view.addSubview(signUpView)
        [signUpView.identificationTextField, signUpView.nickNameTextField, signUpView.passwordTextField, signUpView.passwordCheckTextField, signUpView.phoneTextField].forEach { $0.delegate = self }
        
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
    
    func isAvailableID(_ id: String) -> Bool {
        let duplicationID = RegisterManager.shared.registerList.filter { $0.identification == id }
        
        if id.isEmpty {
            signUpView.identificationTextField.placeholder = "아이디를 입력해주세요."
            return false
        } else if !duplicationID.isEmpty {
            signUpView.identificationTextField.placeholder = "중복된 아이디입니다."
        } else {
            signUpView.identificationTextField.placeholder = ""
        }
        
        return duplicationID.isEmpty
    }
    
    func isAvailableNickName(_ nickName: String) -> Bool {
        let duplicationNickName = RegisterManager.shared.registerList.filter { $0.nickName == nickName }
        
        if nickName.isEmpty {
            signUpView.nickNameTextField.placeholder = "닉네임을 입력해주세요."
            return false
        } else if !duplicationNickName.isEmpty {
            signUpView.identificationTextField.placeholder = "중복된 닉네임입니다."
        } else {
            signUpView.identificationTextField.placeholder = ""
        }
        
        return duplicationNickName.isEmpty
    }
    
    func isAvailablePassword(_ password: String, _ passwordCheck: String) -> Bool {
        /// 특수문자 캐릭터셋
        let punctuationCharacterSet = CharacterSet.punctuationCharacters
        let upperChar = password.filter { $0.isUppercase }
        let lowerChar = password.filter { $0.isLowercase}
        
        if password.isEmpty {
            signUpView.passwordTextField.placeholder = "비밀번호를 입력해주세요."
            signUpView.passwordCheckTextField.placeholder = ""
            return false
        } else if passwordCheck.isEmpty {
            signUpView.passwordTextField.placeholder = ""
            signUpView.passwordCheckTextField.placeholder = "비밀번호를 재입력해주세요."
            return false
        } else if password != passwordCheck {
            signUpView.passwordTextField.placeholder = "입력한 비밀번호가 일치하지 않습니다."
            signUpView.passwordCheckTextField.placeholder = ""
            return false
        } else if password.rangeOfCharacter(from: punctuationCharacterSet) == nil {
            signUpView.passwordTextField.placeholder = "특수문자가 포함되어야 합니다."
            signUpView.passwordCheckTextField.placeholder = ""
            return false
        } else if upperChar.isEmpty || lowerChar.isEmpty {
            signUpView.passwordTextField.placeholder = "대소문자가 포함되어야 합니다."
            signUpView.passwordCheckTextField.placeholder = ""
            return false
        }
        
        signUpView.passwordTextField.placeholder = ""
        signUpView.passwordCheckTextField.placeholder = ""
        return true
    }
    
    func isAvailablePhone(_ phone: String) -> Bool {
        let duplicationPhone = RegisterManager.shared.registerList.filter { $0.phone == phone }
        
        if phone.isEmpty {
            signUpView.phoneTextField.placeholder = "전화번호를 입력해주세요."
            return false
        } else if !duplicationPhone.isEmpty {
            signUpView.phoneTextField.placeholder = "이미 가입된 번호입니다."
            return false
        }
        
        if Int(phone) == nil {
            signUpView.phoneTextField.placeholder = "숫자만 입력해주세요."
            return false
        }
        return true
    }
    
    @objc func signUpButtonClicked(sender: UIButton) {
        animateView(viewToAnimate: sender)
        
        guard let identification = signUpView.identificationTextField.text else { return }
        guard let nickName = signUpView.nickNameTextField.text else { return }
        guard let password = signUpView.passwordTextField.text else { return }
        guard let passwordCheck = signUpView.passwordCheckTextField.text else { return }
        guard let phone = signUpView.phoneTextField.text else { return }
        
        signUpView.identificationTextField.placeholder = ""
        signUpView.nickNameTextField.placeholder = ""
        signUpView.passwordTextField.placeholder = ""
        signUpView.passwordCheckTextField.placeholder = ""
        signUpView.phoneTextField.placeholder = ""
        
        if !isAvailableID(identification) { return }
        if !isAvailableNickName(nickName) { return }
        if !isAvailablePassword(password, passwordCheck) { return }
        if !isAvailablePhone(phone) { return }
        if identification.isEmpty || nickName.isEmpty || password.isEmpty || phone.isEmpty { return }
        
        let register = Register(identification: identification, nickName: nickName , password: password, phone: phone, playList: PlayList())
        
        RegisterManager.shared.registerList.append(register)
        
        let alertVC = SuccessAlertViewController()
        alertVC.modalPresentationStyle = .overCurrentContext
        present(alertVC, animated: true)
    }
}

extension SignUpViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
