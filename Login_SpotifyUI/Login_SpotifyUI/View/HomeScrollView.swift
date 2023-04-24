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
        [welcomeLabel].forEach { contentView.addSubview($0) }
        
        self.backgroundColor = .white
        welcomeLabel.font = ProjFont.metro27
        welcomeLabel.textAlignment = .left
        welcomeLabel.text = "환영"
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
    }
}
