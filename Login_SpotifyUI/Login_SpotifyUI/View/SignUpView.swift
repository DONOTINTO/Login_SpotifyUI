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
}
