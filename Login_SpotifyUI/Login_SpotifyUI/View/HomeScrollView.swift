//
//  HomeScrollView.swift
//  Login_SpotifyUI
//
//  Created by 이중엽 on 2023/04/24.
//

import UIKit
import SnapKit

class HomeScrollView: UIScrollView {
    let contentView = UIView()
    let welcomeLabel = UILabel()
    let profileView = ProfileView()
    let myPlayListLabel = UILabel()
    let addPlayListButton = UIButton()
    let playListTableView = UITableView()
    let logoutButton = UIButton()
    let deleteAccountButton = UIButton()
    let accountButtonStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initialSetup()
        makeUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func initialSetup() {
        [contentView].forEach { self.addSubview($0) }
        [welcomeLabel, profileView, myPlayListLabel, addPlayListButton, playListTableView, accountButtonStackView].forEach { contentView.addSubview($0) }
        [logoutButton, deleteAccountButton].forEach { accountButtonStackView.addArrangedSubview($0) }
        
        self.backgroundColor = .black
        welcomeLabel.text = "환영"
        welcomeLabel.font = ProjFont.metro27
        welcomeLabel.textColor = .white
        welcomeLabel.textAlignment = .left
        
        profileView.layer.cornerRadius = 10
        
        myPlayListLabel.text = "마이 플레이리스트"
        myPlayListLabel.font = ProjFont.metro25
        myPlayListLabel.textColor = .white
        myPlayListLabel.textAlignment = .left
        
        
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 25, weight: .light)
        let image = UIImage(systemName: "plus.app", withConfiguration: imageConfig)
        addPlayListButton.setImage(image, for: .normal)
        addPlayListButton.tintColor = .white
        addPlayListButton.layer.cornerRadius = 25
        
        playListTableView.backgroundColor = .black
        
        accountButtonStackView.axis = .horizontal
        accountButtonStackView.spacing = 10
        accountButtonStackView.alignment = .fill
        accountButtonStackView.distribution = .fillEqually
        
        logoutButton.setTitle("로그아웃", for: .normal)
        logoutButton.setTitleColor(.black, for: .normal)
        logoutButton.backgroundColor = ProjColor.green
        logoutButton.layer.cornerRadius = 15
        
        deleteAccountButton.setTitle("회원탈퇴", for: .normal)
        deleteAccountButton.setTitleColor(.black, for: .normal)
        deleteAccountButton.backgroundColor = ProjColor.green
        deleteAccountButton.layer.cornerRadius = 15
    }
    
    func makeUI() {
        contentView.snp.makeConstraints {
            $0.width.equalTo(self.snp.width)
            $0.edges.equalTo(self.snp.edges)
        }
        
        welcomeLabel.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top).offset(30)
            $0.leading.equalTo(contentView.snp.leading).offset(20)
        }
        
        profileView.snp.makeConstraints {
            $0.height.equalTo(120)
            $0.top.equalTo(welcomeLabel.snp.bottom).offset(15)
            $0.leading.equalTo(self.snp.leading).offset(20)
            $0.trailing.equalTo(self.snp.trailing).offset(-20)
        }
        
        myPlayListLabel.snp.makeConstraints {
            $0.top.equalTo(profileView.snp.bottom).offset(50)
            $0.leading.equalTo(self.snp.leading).offset(20)
        }
        
        addPlayListButton.snp.makeConstraints {
            $0.height.equalTo(myPlayListLabel.snp.height)
            $0.width.equalTo(addPlayListButton.snp.height)
            $0.centerY.equalTo(myPlayListLabel.snp.centerY)
            $0.trailing.equalTo(self.snp.trailing).offset(-20)
        }
        
        playListTableView.snp.makeConstraints {
            $0.top.equalTo(myPlayListLabel.snp.bottom).offset(10)
            $0.leading.equalTo(self.snp.leading).offset(20)
            $0.trailing.equalTo(self.snp.trailing).offset(-20)
            $0.height.equalTo(500)
        }
        
        accountButtonStackView.snp.makeConstraints {
            $0.top.equalTo(playListTableView.snp.bottom).offset(20)
            $0.leading.equalTo(self.snp.leading).offset(20)
            $0.trailing.equalTo(self.snp.trailing).offset(-20)
            $0.height.equalTo(49)
            $0.bottom.equalTo(self.snp.bottom).offset(-20)
        }
    }
    
    func updateUI(height: Int) {
        playListTableView.snp.remakeConstraints {
            $0.top.equalTo(myPlayListLabel.snp.bottom).offset(10)
            $0.leading.equalTo(self.snp.leading).offset(20)
            $0.trailing.equalTo(self.snp.trailing).offset(-20)
            $0.height.equalTo(height)
        }
    }
}
