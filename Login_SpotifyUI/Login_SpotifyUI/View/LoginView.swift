//
//  LoginView.swift
//  Login_SpotifyUI
//
//  Created by 이중엽 on 2023/04/11.
//

import UIKit
import SnapKit

class LoginView: UIView {
    let identificationLabel = UILabel()
    let identificationTextField = UITextField()
    let passwordLabel = UILabel()
    let passwordTextField = UITextField()
    let passwordHideButton = UIButton()
    let loginButton = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func initialSetup() {
        identificationLabel.text = "아이디 또는 이메일 주소"
        identificationLabel.textColor = .white
        identificationLabel.font = UIFont(name: "Metropolis-SemiBold", size: 25)
        
        passwordLabel.text = "비밀번호"
        passwordLabel.textColor = .white
        passwordLabel.font = UIFont(name: "Metropolis-SemiBold", size: 25)
        
        passwordHideButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        passwordHideButton.tintColor = .white
        passwordHideButton.imageView?.frame.size.width = 27
        passwordHideButton.imageView?.frame.size.height = 23
        
        loginButton.setTitle("로그인", for: .normal)
        loginButton.setTitleColor(.black, for: .normal)
        loginButton.backgroundColor = UIColor(red: 30/255, green: 215/255, blue: 96/255, alpha: 1)
        loginButton.titleLabel?.font = UIFont(name: "Metropolis-SemiBold", size: 16)
        
        identificationTextField.layer.cornerRadius = 4
        identificationTextField.textColor = .white
        identificationTextField.font = UIFont(name: "Metropolis-SemiBold", size: 22)
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.frame.height))
        identificationTextField.leftView = paddingView
        identificationTextField.leftViewMode = .always
        identificationTextField.backgroundColor = UIColor(red: 65/255, green: 65/255, blue: 65/255, alpha: 1)
        
        passwordTextField.layer.cornerRadius = 4
        passwordTextField.textColor = .white
        passwordTextField.font = UIFont(name: "Metropolis-SemiBold", size: 22)
        let paddingView1 = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.frame.height))
        passwordTextField.leftView = paddingView1
        passwordTextField.leftViewMode = .always
        passwordTextField.backgroundColor = UIColor(red: 65/255, green: 65/255, blue: 65/255, alpha: 1)
    }
}
