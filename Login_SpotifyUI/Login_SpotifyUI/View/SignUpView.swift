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
        
        labelInit(identificationLabel, title: "아이디 또는 이메일 주소", textColor: .white, font: ProjFont.metro25)
        labelInit(passwordLabel, title: "비밀번호", textColor: .white, font: ProjFont.metro25)
        labelInit(passwordErrorLabel, title: "비밀번호를 확인해주세요.", textColor: ProjColor.green, font: ProjFont.metro15)
        labelInit(passwordCheckLabel, title: "비밀번호 재입력", textColor: .white, font: ProjFont.metro25)
        labelInit(phoneLabel, title: "전화번호", textColor: .white, font: ProjFont.metro25)
        
        signUpButton.setTitle("회원가입", for: .normal)
        signUpButton.setTitleColor(.black, for: .normal)
        signUpButton.backgroundColor = ProjColor.green
        signUpButton.titleLabel?.font = ProjFont.metro16
        
        textFieldInit(identificationTextField)
        textFieldInit(passwordTextField)
        textFieldInit(passwordCheckTextField)
        textFieldInit(phoneTextField)
        
        signUpButton.layer.cornerRadius = 25
    }
    
    func labelInit(_ label: UILabel, title: String, textColor: UIColor, font: UIFont) {
        label.text = title
        label.textColor = textColor
        label.font = font
    }
    
    func textFieldInit(_ textField: UITextField) {
        textField.layer.cornerRadius = 4
        textField.textColor = .white
        textField.font = ProjFont.metro22
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.backgroundColor = ProjColor.lightGray
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
