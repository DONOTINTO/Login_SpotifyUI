//
//  SuccessAlertView.swift
//  Login_SpotifyUI
//
//  Created by 이중엽 on 2023/04/15.
//

import UIKit
import SnapKit

class SuccessAlertView: UIView {
    
    let logoImage = UIImageView()
    let welcomeLabel = UILabel()
    let confirmButton = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initialSetup()
        makeUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func initialSetup() {
        [logoImage, welcomeLabel, confirmButton].forEach { self.addSubview($0) }
        self.backgroundColor = .black
        self.layer.cornerRadius = 30
        self.layer.borderColor = ProjColor.green.cgColor
        self.layer.borderWidth = 1
        
        logoImage.image = UIImage(named: "CI")
        
        welcomeLabel.text = "회원가입이 완료되었습니다!"
        welcomeLabel.font = ProjFont.metro25
        welcomeLabel.textColor = .white
        
        confirmButton.setTitle("확인", for: .normal)
        confirmButton.setTitleColor(.black, for: .normal)
        confirmButton.backgroundColor = ProjColor.green
        confirmButton.layer.cornerRadius = 25
    }
 
    func makeUI() {
        logoImage.snp.makeConstraints {
            $0.top.equalTo(self.snp.top).offset(39)
            $0.centerX.equalTo(self.snp.centerX)
        }
        
        welcomeLabel.snp.makeConstraints {
            $0.top.equalTo(logoImage.snp.bottom).offset(39)
            $0.centerX.equalTo(self.snp.centerX)
        }
        
        confirmButton.snp.makeConstraints {
            $0.height.equalTo(49)
            $0.width.equalTo(134)
            $0.top.equalTo(welcomeLabel.snp.bottom).offset(39)
            $0.bottom.equalTo(self.snp.bottom).offset(-39)
            $0.centerX.equalTo(self.snp.centerX)
        }
    }
}
