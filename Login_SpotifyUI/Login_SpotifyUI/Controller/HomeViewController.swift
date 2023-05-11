//
//  HomeViewController.swift
//  Login_SpotifyUI
//
//  Created by 이중엽 on 2023/04/24.
//

import UIKit
import SnapKit
import RealmSwift

class HomeViewController: UIViewController {
    let homeScrollView = HomeScrollView()
    let imagePickerController = UIImagePickerController()
    let realm = try! Realm()
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
        imagePickerController.delegate = self
        
        if let register = self.register {
            homeScrollView.welcomeLabel.text = "환영합니다. \(register.nickname)님"
            homeScrollView.profileView.playListCountLabel.text = "플레이리스트: \(register.playList.count)개"
            let likeList = register.playList.filter { $0.isLike }
            homeScrollView.profileView.likeCountLabel.text = "좋아요: \(likeList.count)개"
        }
        
        homeScrollView.profileView.editProfileButton.addTarget(self, action: #selector(editProfileButtonClicked), for: .touchUpInside)
        homeScrollView.addPlayListButton.addTarget(self, action: #selector(addPlayListButtonClicked), for: .touchUpInside)
        homeScrollView.logoutButton.addTarget(self, action: #selector(testOut), for: .touchUpInside)
    }
    
    func makeUI() {
        homeScrollView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide.snp.edges)
            $0.width.equalTo(view.snp.width)
        }
    }
    
    @objc func editProfileButtonClicked() {
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.allowsEditing = true
        present(imagePickerController, animated: true)
    }
    
    @objc func addPlayListButtonClicked() {
        guard let register = self.register else { return }
        let newMusic = Music(title: "test-title", artist: "test-artist")
        let realmData = RealmData(realm: realm)
        realmData.addPlayList(identifier: register.identification, newMusic: newMusic)
        homeScrollView.playListTableView.reloadData()
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
        guard let register = self.register else { return 0 }
        return register.playList.count
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard let register = self.register else { return }
        
        if editingStyle == .delete {
            let realmData = RealmData(realm: realm)
            realmData.removePlayList(identifier: register.identification, index: indexPath.row)
            homeScrollView.playListTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PlayListTableViewCell.identifier, for: indexPath) as? PlayListTableViewCell else { return UITableViewCell() }
        
        if let register = self.register {
            let music = register.playList[indexPath.row]
            cell.music = music
        }
        
        cell.backgroundColor = .clear
        cell.contentView.layer.cornerRadius = 10
        cell.contentView.layer.masksToBounds = true
        cell.initialSetup()
        cell.makeUI()
        return cell
    }
}

extension HomeViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as? UIImage
        self.homeScrollView.profileView.profileImage.image = image
        dismiss(animated: true)
    }
}
