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
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
 
    func makeUI() {
        self.snp.makeConstraints {
            $0.height.equalToSuperview().dividedBy(3)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.centerX.centerY.equalToSuperview()
        }
        
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
            $0.centerX.equalTo(self.snp.centerX)
        }
    }
}
