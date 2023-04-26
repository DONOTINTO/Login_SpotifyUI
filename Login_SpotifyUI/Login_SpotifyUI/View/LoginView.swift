//
//  LoginView.swift
//  Login_SpotifyUI
//
//  Created by 이중엽 on 2023/04/11.
//

import UIKit
import SnapKit
import TextFieldEffects

class LoginView: UIView {
    let identificationLabel = UILabel()
    let identificationTextField = YokoTextField()
    let passwordLabel = UILabel()
    let passwordTextField = YokoTextField()
    let passwordHideButton = UIButton()
    let loginButton = UIButton()
    
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
        identificationLabel.font = ProjFont.metro25
        
        passwordLabel.text = "비밀번호"
        passwordLabel.textColor = .white
        passwordLabel.font = ProjFont.metro25
        
        passwordHideButton.setImage(ProjImage.eyeSlash, for: .normal)
        passwordHideButton.tintColor = .white
        passwordHideButton.imageView?.frame.size.width = 27
        passwordHideButton.imageView?.frame.size.height = 23
        
        loginButton.setTitle("로그인", for: .normal)
        loginButton.setTitleColor(.black, for: .normal)
        loginButton.layer.cornerRadius = 25
        loginButton.backgroundColor = ProjColor.green
        loginButton.titleLabel?.font = ProjFont.metro16
        
        textFieldInit(identificationTextField)
        textFieldInit(passwordTextField)
    }
    
    func textFieldInit(_ textfield: YokoTextField) {
        textfield.layer.cornerRadius = 4
        textfield.textColor = .white
        textfield.font = ProjFont.metro22
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.frame.height))
        textfield.leftView = paddingView
        textfield.leftViewMode = .always
        textfield.foregroundColor = ProjColor.lightGray
        textfield.placeholderColor = ProjColor.green
    }
    
    func makeUI() {
        [identificationLabel, identificationTextField, passwordLabel, passwordTextField, passwordHideButton, loginButton].forEach { self.addSubview($0) }
        
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
        
        passwordLabel.snp.makeConstraints {
            $0.top.equalTo(identificationTextField.snp.bottom).offset(24)
            $0.leading.equalTo(self.snp.leading).offset(18)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(passwordLabel.snp.bottom).offset(8)
            $0.leading.equalTo(self.snp.leading).offset(16)
            $0.trailing.equalTo(self.snp.trailing).offset(-16)
            $0.height.equalTo(60)
        }
        
        passwordHideButton.snp.makeConstraints {
            $0.centerY.equalTo(passwordTextField.snp.centerY).offset(-10)
            $0.trailing.equalTo(passwordTextField.snp.trailing).inset(12)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(50)
            $0.centerX.equalTo(self.snp.centerX)
            $0.width.equalTo(134)
            $0.height.equalTo(49)
        }
    }
}
