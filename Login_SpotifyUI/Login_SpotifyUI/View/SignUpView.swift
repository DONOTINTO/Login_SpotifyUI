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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
        makeUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func initialSetup() {
        self.backgroundColor = .black
        
        identificationLabel.text = "아이디 또는 이메일 주소"
        identificationLabel.textColor = .white
        identificationLabel.font = UIFont(name: "Metropolis-SemiBold", size: 25)
        
        passwordLabel.text = "비밀번호"
        passwordLabel.textColor = .white
        passwordLabel.font = UIFont(name: "Metropolis-SemiBold", size: 25)
        
        passwordErrorLabel.text = "비밀번호를 확인해주세요."
        passwordErrorLabel.textColor = UIColor(red: 30/255, green: 215/255, blue: 96/255, alpha: 1)
        passwordErrorLabel.font = UIFont(name: "Metropolis-SemiBold", size: 15)
        
        passwordCheckLabel.text = "비밀번호 재입력"
        passwordCheckLabel.textColor = .white
        passwordCheckLabel.font = UIFont(name: "Metropolis-SemiBold", size: 25)
        
        phoneLabel.text = "전화번호"
        phoneLabel.textColor = .white
        phoneLabel.font = UIFont(name: "Metropolis-SemiBold", size: 25)
        
        signUpButton.setTitle("회원가입", for: .normal)
        signUpButton.setTitleColor(.black, for: .normal)
        signUpButton.backgroundColor = UIColor(red: 30/255, green: 215/255, blue: 96/255, alpha: 1)
        signUpButton.titleLabel?.font = UIFont(name: "Metropolis-SemiBold", size: 16)
        
        textFieldInit(identificationTextField)
        textFieldInit(passwordTextField)
        textFieldInit(passwordCheckTextField)
        textFieldInit(phoneTextField)
        
        signUpButton.layer.cornerRadius = 25
    }
    
    func textFieldInit(_ textField: UITextField) {
        textField.layer.cornerRadius = 4
        textField.textColor = .white
        textField.font = UIFont(name: "Metropolis-SemiBold", size: 22)
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.backgroundColor = UIColor(red: 65/255, green: 65/255, blue: 65/255, alpha: 1)
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
            $0.trailing.equalTo(self.snp.trailing).offset(-16)
            $0.height.equalTo(48)
        }
        
        passwordLabel.snp.makeConstraints {
            $0.top.equalTo(identificationTextField.snp.bottom).offset(24)
            $0.leading.equalTo(self.snp.leading).offset(18)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(passwordLabel.snp.bottom).offset(8)
            $0.leading.equalTo(self.snp.leading).offset(16)
            $0.trailing.equalTo(self.snp.trailing).offset(-16)
            $0.height.equalTo(48)
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
            $0.trailing.equalTo(self.snp.trailing).offset(-16)
            $0.height.equalTo(48)
        }
        
        phoneLabel.snp.makeConstraints {
            $0.top.equalTo(passwordCheckTextField.snp.bottom).offset(24)
            $0.leading.equalTo(self.snp.leading).offset(18)
        }
        
        phoneTextField.snp.makeConstraints {
            $0.top.equalTo(phoneLabel.snp.bottom).offset(8)
            $0.leading.equalTo(self.snp.leading).offset(16)
            $0.trailing.equalTo(self.snp.trailing).offset(-16)
            $0.height.equalTo(48)
        }
        
        signUpButton.snp.makeConstraints {
            $0.top.equalTo(phoneTextField.snp.bottom).offset(50)
            $0.centerX.equalTo(self.snp.centerX)
            $0.width.equalTo(134)
            $0.height.equalTo(49)
        }
    }
}
