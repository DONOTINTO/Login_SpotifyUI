//
//  EntryView.swift
//  Login_SpotifyUI
//
//  Created by 이중엽 on 2023/04/09.
//

import UIKit
import SnapKit

class EntryView: UIView {
    let logoImage = UIImageView()
    let introLabel = UILabel()
    let signUpButton = UIButton()
    let loginButton = UIButton()
    let testButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initialSetup()
        makeUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func initialSetup() {
        [logoImage, introLabel, signUpButton, loginButton, testButton].forEach { self.addSubview($0) }
        self.backgroundColor = .black
        
        logoImage.image = UIImage(named: "Spotify_Logo")
        
        introLabel.text = "내 마음에 꼭 드는 또 다른 플레이리스트를 발견해보세요."
        introLabel.font = ProjFont.metro27
        introLabel.textColor = .white
        introLabel.textAlignment = .center
        introLabel.numberOfLines = 0
        
        buttonInit(button: signUpButton, title: "가입하기", titleColor: .black)
        buttonInit(button: loginButton, title: "로그인하기", titleColor: .white)
        buttonInit(button: testButton, title: "테스트", titleColor: .white)
        signUpButton.backgroundColor = ProjColor.green
        loginButton.backgroundColor = .black
        testButton.backgroundColor = .black
    }
    
    func buttonInit(button: UIButton, title: String, titleColor: UIColor) {
        button.setTitle(title, for: .normal)
        button.setTitleColor(titleColor, for: .normal)
        button.titleLabel?.font = ProjFont.metro16
        button.layer.cornerRadius = 25
    }
    
    func makeUI() {
        logoImage.snp.makeConstraints {
            $0.centerX.equalTo(self.snp.centerX)
            $0.bottom.equalTo(introLabel.snp.top).offset(-25)
        }
        
        introLabel.snp.makeConstraints {
            $0.centerX.equalTo(self.snp.centerX)
            $0.centerY.equalTo(self.snp.centerY)
            $0.leading.equalTo(self.snp.leading).offset(35)
            $0.trailing.equalTo(self.snp.trailing).offset(-35)
        }
        
        signUpButton.snp.makeConstraints {
            $0.height.equalTo(48)
            $0.top.equalTo(introLabel.snp.bottom).offset(55)
            $0.centerX.equalTo(self.snp.centerX)
            $0.leading.equalTo(self.snp.leading).offset(32)
            $0.trailing.equalTo(self.snp.trailing).offset(-32)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(signUpButton.snp.bottom).offset(30)
            $0.centerX.equalTo(self.snp.centerX)
        }
        
        testButton.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(30)
            $0.centerX.equalTo(self.snp.centerX)
        }
    }
}
