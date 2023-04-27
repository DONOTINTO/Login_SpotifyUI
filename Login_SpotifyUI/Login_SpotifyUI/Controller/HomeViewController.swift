//
//  HomeViewController.swift
//  Login_SpotifyUI
//
//  Created by 이중엽 on 2023/04/24.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    let homeScrollView = HomeScrollView()
    var register: Register?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialSetup()
        makeUI()
    }
    
    func initialSetup() {
        view.addSubview(homeScrollView)
        homeScrollView.playListTableView.register(PlayListTableViewCell.self, forCellReuseIdentifier: PlayListTableViewCell.identifier)
        homeScrollView.playListTableView.delegate = self
        homeScrollView.playListTableView.dataSource = self
        
        if let register = self.register {
            homeScrollView.welcomeLabel.text = "환영합니다. \(register.nickName)님"
        }
        
        homeScrollView.logoutButton.addTarget(self, action: #selector(testOut), for: .touchUpInside)
    }
    
    func makeUI() {
        homeScrollView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide.snp.edges)
            $0.width.equalTo(view.snp.width)
        }
    }
    
    @objc func testOut() {
        dismiss(animated: true)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let spacing: CGFloat = 10
        let titleHeight: CGFloat = ProjFont.metro22.lineHeight
        let nameHeight: CGFloat = ProjFont.metro15.lineHeight
        
        return titleHeight + nameHeight + (spacing * 3)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PlayListTableViewCell.identifier, for: indexPath) as? PlayListTableViewCell else { return UITableViewCell() }
        
        cell.backgroundColor = .clear
        cell.contentView.layer.cornerRadius = 10
        cell.contentView.layer.masksToBounds = true
        cell.initialSetup()
        cell.makeUI()
        
        return cell
    }
}
