//
//  EntryViewController.swift
//  Login_SpotifyUI
//
//  Created by 이중엽 on 2023/04/09.
//

import UIKit
import SnapKit

class EntryViewController: UIViewController {
    let entryView = EntryView()

    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        makeUI()
    }

    func initialSetup() {
        view.addSubview(entryView)
        entryView.signUpButton.addTarget(self, action: #selector(signUpButtonClicked), for: .touchUpInside)
    }

    func makeUI() {
        entryView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide.snp.edges)
        }
    }
    
    @objc func signUpButtonClicked() {
        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        backBarButtonItem.tintColor = .white
        self.navigationItem.backBarButtonItem = backBarButtonItem
        navigationController?.pushViewController(SignUpViewController(), animated: true)
    }
}

