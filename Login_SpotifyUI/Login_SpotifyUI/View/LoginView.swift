//
//  LoginView.swift
//  Login_SpotifyUI
//
//  Created by 이중엽 on 2023/04/11.
//

import UIKit

class LoginView: UIView {
    let identificationLabel = UILabel()
    let identificationTextField = UITextField()
    let passwordLabel = UILabel()
    let passwordTextField = UITextField()
    let passwordHideButton = UIButton()
    let loginButton = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
