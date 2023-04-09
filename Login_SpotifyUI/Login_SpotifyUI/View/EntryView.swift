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
        logoImage.image = UIImage(named: "Spotify_Logo")
        
        introLabel.text = "내 마음에 꼭 드는 또 다른 플레이리스트를 발견해보세요."
        introLabel.textColor = .white
        
        signUpButton.setTitle("가입하기", for: .normal)
        signUpButton.layer.cornerRadius = 25
        signUpButton.backgroundColor = .green
        
        loginButton.setTitle("로그인하기", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.backgroundColor = .black
    }

}
