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
        [welcomeLabel, profileView].forEach { contentView.addSubview($0) }
        
        self.backgroundColor = .black
        welcomeLabel.text = "환영"
        welcomeLabel.font = ProjFont.metro27
        welcomeLabel.textColor = .white
        welcomeLabel.textAlignment = .left
        
        profileView.layer.cornerRadius = 10
        
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
    }
}
