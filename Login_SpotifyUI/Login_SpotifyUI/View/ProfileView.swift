//
//  ProfileView.swift
//  Login_SpotifyUI
//
//  Created by 이중엽 on 2023/04/24.
//

import UIKit
import SnapKit

class ProfileView: UIView {
    let playListCountLabel = UILabel()
    let likeCountLabel = UILabel()
    let editProfileButton = UIButton()
    let profileImage = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initialSetup()
        makeUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func initialSetup() {
        self.backgroundColor = ProjColor.lightGray
        [playListCountLabel, likeCountLabel, editProfileButton, profileImage].forEach { self.addSubview($0) }
        
        playListCountLabel.text = "플레이리스트 : 0개"
        playListCountLabel.font = ProjFont.metro16
        playListCountLabel.textColor = .white
        
        likeCountLabel.text = "좋아요 : 0개"
        likeCountLabel.font = ProjFont.metro16
        likeCountLabel.textColor = .white
        
        editProfileButton.setTitle("정보 수정", for: .normal)
        editProfileButton.setTitleColor(.black, for: .normal)
        editProfileButton.backgroundColor = ProjColor.green
        editProfileButton.layer.cornerRadius = 15
        
        profileImage.image = UIImage(systemName: "pencil")
    }
    
    func makeUI() {
        playListCountLabel.snp.makeConstraints {
            $0.top.equalTo(self.snp.top).offset(10)
            $0.leading.equalTo(self.snp.leading).offset(10)
        }
        
        likeCountLabel.snp.makeConstraints {
            $0.top.equalTo(playListCountLabel.snp.bottom).offset(10)
            $0.leading.equalTo(self.snp.leading).offset(10)
        }
        
        editProfileButton.snp.makeConstraints {
            $0.top.equalTo(likeCountLabel.snp.bottom).offset(18)
            $0.leading.equalTo(self.snp.leading).offset(10)
            $0.bottom.equalTo(self.snp.bottom).offset(-10)
        }
        
        profileImage.snp.makeConstraints {
            $0.width.height.equalTo(100)
            $0.leading.equalTo(editProfileButton.snp.trailing).offset(26)
            $0.trailing.equalTo(self.snp.trailing).offset(-26)
            $0.centerY.equalTo(self.snp.centerY)
        }
    }
}
