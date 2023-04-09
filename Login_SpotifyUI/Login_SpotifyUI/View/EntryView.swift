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
    
    func initialSetup() {
        [logoImage, introLabel, signUpButton, loginButton].forEach { self.addSubview($0) }
        self.backgroundColor = .black
        
        logoImage.image = UIImage(named: "Spotify_Logo")
        
        introLabel.text = "내 마음에 꼭 드는 또 다른 플레이리스트를 발견해보세요."
        introLabel.font = UIFont(name: "Metropolis-SemiBold", size: 27)
        introLabel.textColor = .white
        introLabel.textAlignment = .center
        introLabel.numberOfLines = 0
        
        signUpButton.setTitle("가입하기", for: .normal)
        signUpButton.setTitleColor(.black, for: .normal)
        signUpButton.titleLabel?.font = UIFont(name: "Metropolis-SemiBold", size: 16)
        signUpButton.layer.cornerRadius = 25
        signUpButton.backgroundColor = .green
        
        loginButton.setTitle("로그인하기", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.titleLabel?.font = UIFont(name: "Metropolis-SemiBold", size: 16)
        loginButton.backgroundColor = .black
    }

    func makeUI() {
        logoImage.snp.makeConstraints {
            $0.top.equalTo(self.snp.top).offset(250)
            $0.centerX.equalTo(self.snp.centerX)
        }
        
        introLabel.snp.makeConstraints {
            $0.top.equalTo(logoImage.snp.bottom).offset(25)
            $0.centerX.equalTo(self.snp.centerX)
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
    }
}
