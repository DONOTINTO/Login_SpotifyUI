//
//  HomeScrollView.swift
//  Login_SpotifyUI
//
//  Created by 이중엽 on 2023/04/24.
//

import UIKit

class HomeScrollView: UIScrollView {

    let contentView = UIView()
    let welcomeLabel = UILabel()
    let profileView = ProfileView()
    let myPlayListLabel = UILabel()
    let addPlayListButton = UIButton()
    let playListTableView = UITableView()
    
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
        [welcomeLabel, profileView, myPlayListLabel, addPlayListButton, playListTableView].forEach { contentView.addSubview($0) }
        
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
    }
    
    func makeUI() {
        contentView.snp.makeConstraints {
            $0.edges.equalTo(self.snp.edges)
            $0.width.equalTo(self.snp.width)
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
            $0.height.equalTo(700)
        }
    }
}
