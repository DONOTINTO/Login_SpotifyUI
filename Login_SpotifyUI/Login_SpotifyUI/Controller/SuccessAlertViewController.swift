//
//  SuccessAlertViewController.swift
//  Login_SpotifyUI
//
//  Created by 이중엽 on 2023/04/15.
//

import UIKit
import SnapKit

class SuccessAlertViewController: UIViewController {
    let successAlertView = SuccessAlertView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialSetup()
        makeUI()
    }
    
    func initialSetup() {
        view.addSubview(successAlertView)
    }
    
    func makeUI() {
        successAlertView.snp.makeConstraints {
            $0.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading).offset(20)
            $0.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing).offset(-20)
            $0.centerY.equalTo(self.view.snp.centerY)
        }
    }
}
