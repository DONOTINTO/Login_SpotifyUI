//
//  SignUpView.swift
//  Login_SpotifyUI
//
//  Created by 이중엽 on 2023/04/10.
//

import UIKit
import SnapKit
import TextFieldEffects

class SignUpView: UIView {
    let identificationLabel = UILabel()
    let identificationTextField = YokoTextField()
    let nickNameLabel = UILabel()
    let nickNameTextField = YokoTextField()
    let passwordLabel = UILabel()
    let passwordTextField = YokoTextField()
    let passwordCheckLabel = UILabel()
    let passwordCheckTextField = YokoTextField()
    let phoneLabel = UILabel()
    let phoneTextField = YokoTextField()
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
        labelInit(nickNameLabel, title: "닉네임", textColor: .white, font: ProjFont.metro25)
        labelInit(passwordLabel, title: "비밀번호", textColor: .white, font: ProjFont.metro25)
        labelInit(passwordCheckLabel, title: "비밀번호 재입력", textColor: .white, font: ProjFont.metro25)
        labelInit(phoneLabel, title: "전화번호", textColor: .white, font: ProjFont.metro25)
        
        signUpButton.setTitle("회원가입", for: .normal)
        signUpButton.setTitleColor(.black, for: .normal)
        signUpButton.backgroundColor = ProjColor.green
        signUpButton.titleLabel?.font = ProjFont.metro16
        
        textFieldInit(identificationTextField)
        identificationTextField.keyboardType = .emailAddress
        textFieldInit(nickNameTextField)
        textFieldInit(passwordTextField)
        passwordTextField.placeholder = "대소문자 및 특수문자가 포함되어야 합니다."
        textFieldInit(passwordCheckTextField)
        textFieldInit(phoneTextField)
        
        signUpButton.layer.cornerRadius = 25
    }
    
    func labelInit(_ label: UILabel, title: String, textColor: UIColor, font: UIFont) {
        label.text = title
        label.textColor = textColor
        label.font = font
    }
    
    func textFieldInit(_ textField: YokoTextField) {
        textField.layer.cornerRadius = 4
        textField.textColor = .white
        textField.font = ProjFont.metro22
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.foregroundColor = ProjColor.lightGray
        textField.placeholderColor = ProjColor.green
    }
    
    func makeUI() {
        [identificationLabel, identificationTextField, nickNameLabel, nickNameTextField, passwordLabel, passwordTextField, passwordCheckLabel, passwordCheckTextField, phoneLabel, phoneTextField, signUpButton].forEach { addSubview($0) }
        
        identificationLabel.snp.makeConstraints {
            $0.top.equalTo(self.snp.top).offset(30)
            $0.leading.equalTo(self.snp.leading).offset(18)
        }
        
        identificationTextField.snp.makeConstraints {
            $0.top.equalTo(identificationLabel.snp.bottom).offset(8)
            $0.leading.equalTo(self.snp.leading).offset(16)
            $0.trailing.equalTo(self.snp.trailing).offset(-16)
            $0.height.equalTo(60)
        }
        
        nickNameLabel.snp.makeConstraints {
            $0.top.equalTo(identificationTextField.snp.bottom).offset(10)
            $0.leading.equalTo(self.snp.leading).offset(18)
        }
        
        nickNameTextField.snp.makeConstraints {
            $0.top.equalTo(nickNameLabel.snp.bottom).offset(8)
            $0.leading.equalTo(self.snp.leading).offset(16)
            $0.trailing.equalTo(self.snp.trailing).offset(-16)
            $0.height.equalTo(60)
        }
        
        passwordLabel.snp.makeConstraints {
            $0.top.equalTo(nickNameTextField.snp.bottom).offset(10)
            $0.leading.equalTo(self.snp.leading).offset(18)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(passwordLabel.snp.bottom).offset(8)
            $0.leading.equalTo(self.snp.leading).offset(16)
            $0.trailing.equalTo(self.snp.trailing).offset(-16)
            $0.height.equalTo(60)
        }
        
        passwordCheckLabel.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(10)
            $0.leading.equalTo(self.snp.leading).offset(18)
        }
        
        passwordCheckTextField.snp.makeConstraints {
            $0.top.equalTo(passwordCheckLabel.snp.bottom).offset(8)
            $0.leading.equalTo(self.snp.leading).offset(16)
            $0.trailing.equalTo(self.snp.trailing).offset(-16)
            $0.height.equalTo(60)
        }
        
        phoneLabel.snp.makeConstraints {
            $0.top.equalTo(passwordCheckTextField.snp.bottom).offset(10)
            $0.leading.equalTo(self.snp.leading).offset(18)
        }
        
        phoneTextField.snp.makeConstraints {
            $0.top.equalTo(phoneLabel.snp.bottom).offset(8)
            $0.leading.equalTo(self.snp.leading).offset(16)
            $0.trailing.equalTo(self.snp.trailing).offset(-16)
            $0.height.equalTo(60)
        }
        
        signUpButton.snp.makeConstraints {
            $0.top.equalTo(phoneTextField.snp.bottom).offset(50)
            $0.centerX.equalTo(self.snp.centerX)
            $0.width.equalTo(134)
            $0.height.equalTo(49)
        }
    }
}
