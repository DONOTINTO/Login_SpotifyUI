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
    }

    func initialSetup() {
        view.backgroundColor = .black
        view.addSubview(mainView)
        mainView.initialSetup()
        mainView.makeUI()
    }

}

