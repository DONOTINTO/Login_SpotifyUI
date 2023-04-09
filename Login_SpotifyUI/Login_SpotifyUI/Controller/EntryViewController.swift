//
//  EntryViewController.swift
//  Login_SpotifyUI
//
//  Created by 이중엽 on 2023/04/09.
//

import UIKit
import SnapKit

class EntryViewController: UIViewController {
    let mainView = EntryView()

    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        makeUI()
    }

    func initialSetup() {
        view.addSubview(mainView)
        mainView.initialSetup()
        mainView.makeUI()
    }

    func makeUI() {
        mainView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide.snp.edges)
        }
    }
}

