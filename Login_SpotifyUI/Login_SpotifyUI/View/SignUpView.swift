//
//  SignUpView.swift
//  Login_SpotifyUI
//
//  Created by 이중엽 on 2023/04/10.
//

import UIKit
import SnapKit

class SignUpView: UIView {

    let identificationLabel = UILabel()
    let identificationTextField = UITextField()
    let passwordLabel = UILabel()
    let passwordTextField = UITextField()
    let passwordCheckLabel = UILabel()
    let passwordCheckTextField = UITextField()
    let passwordErrorLabel = UILabel()
    let phoneLabel = UILabel()
    let phoneTextField = UITextField()
    let signUpButton = UIButton()
    
    func initialSetup() {
        identificationLabel.text = "아이디 또는 이메일 주소"
        passwordLabel.text = "비밀번호"
        passwordCheckLabel.text = "비밀번호 재입력"
        phoneLabel.text = "전화번호"
        signUpButton.setTitle("회원가입", for: .normal)
        
        identificationTextField.layer.cornerRadius = 4
        passwordTextField.layer.cornerRadius = 4
        passwordCheckTextField.layer.cornerRadius = 4
        phoneTextField.layer.cornerRadius = 4
        signUpButton.layer.cornerRadius = 25
    }
    
    func makeUI() {
        [identificationLabel, identificationTextField, passwordLabel, passwordTextField, passwordCheckLabel, passwordCheckTextField, passwordErrorLabel, phoneLabel, phoneTextField, signUpButton].forEach { addSubview($0) }
        
        identificationLabel.snp.makeConstraints {
            $0.top.equalTo(self.snp.top).offset(30)
            $0.leading.equalTo(self.snp.leading).offset(18)
        }
        
        identificationTextField.snp.makeConstraints {
            $0.top.equalTo(identificationLabel.snp.bottom).offset(8)
            $0.leading.equalTo(self.snp.leading).offset(16)
            $0.trailing.equalTo(self.snp.trailing).offset(16)
        }
        
        passwordLabel.snp.makeConstraints {
            $0.top.equalTo(identificationTextField.snp.bottom).offset(24)
            $0.leading.equalTo(self.snp.leading).offset(18)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(passwordLabel.snp.bottom).offset(8)
            $0.leading.equalTo(self.snp.leading).offset(16)
            $0.trailing.equalTo(self.snp.trailing).offset(16)
        }
        
        passwordCheckLabel.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(24)
            $0.leading.equalTo(self.snp.leading).offset(18)
        }
        
        passwordErrorLabel.snp.makeConstraints {
            $0.centerY.equalTo(passwordCheckLabel.snp.centerY)
            $0.leading.equalTo(passwordCheckLabel.snp.trailing).offset(5)
        }
        
        passwordCheckTextField.snp.makeConstraints {
            $0.top.equalTo(passwordCheckLabel.snp.bottom).offset(8)
            $0.leading.equalTo(self.snp.leading).offset(16)
            $0.trailing.equalTo(self.snp.trailing).offset(16)
        }
        
        phoneLabel.snp.makeConstraints {
            $0.top.equalTo(passwordCheckTextField.snp.bottom).offset(24)
            $0.leading.equalTo(self.snp.leading).offset(18)
        }
        
        phoneTextField.snp.makeConstraints {
            $0.top.equalTo(phoneLabel.snp.bottom).offset(8)
            $0.leading.equalTo(self.snp.leading).offset(16)
            $0.trailing.equalTo(self.snp.trailing).offset(16)
        }
        
        signUpButton.snp.makeConstraints {
            $0.top.equalTo(phoneTextField.snp.bottom).offset(50)
            $0.centerX.equalTo(self.snp.centerX)
            $0.width.equalTo(134)
        }
    }
}
