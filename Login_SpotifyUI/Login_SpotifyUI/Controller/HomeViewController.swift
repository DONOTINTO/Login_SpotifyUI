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
    let searchController = UISearchController(searchResultsController: nil)
    var register: Register?
    var realmData: RealmData?
    var loginData: LoginData?
    var heightForRow: CGFloat?
    var filteredData: [Music] = []
    
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
        
        homeScrollView.profileView.editProfileButton.addTarget(self, action: #selector(editProfileButtonClicked), for: .touchUpInside)
        homeScrollView.addPlayListButton.addTarget(self, action: #selector(addPlayListButtonClicked), for: .touchUpInside)
        homeScrollView.logoutButton.addTarget(self, action: #selector(logoutButtonClicked), for: .touchUpInside)
        homeScrollView.deleteAccountButton.addTarget(self, action: #selector(deleteAccountButtonClicked), for: .touchUpInside)
        
        realmData = RealmData(realm: realm)
        loginData = LoginData(realm: realm)
        
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.searchBar.tintColor = ProjColor.green
        searchController.searchBar.searchTextField.attributedPlaceholder = NSAttributedString(string: "검색어를 입력하세요.", attributes: [NSAttributedString.Key.foregroundColor : UIColor(white: 1, alpha: 0.5)])
        searchController.searchBar.searchTextField.backgroundColor = ProjColor.lightGray
        
        navigationItem.searchController = searchController
        
        let spacing: CGFloat = 10
        let titleHeight: CGFloat = ProjFont.metro22.lineHeight
        let nameHeight: CGFloat = ProjFont.metro15.lineHeight
        heightForRow = titleHeight + nameHeight + (spacing * 3)
        
        guard let heightForRow = self.heightForRow else { return }
        guard let register = self.register else { return }
        filteredData = register.getPlayListArray()
        
        homeScrollView.updateUI(height: Int(heightForRow) * register.playList.count)
        updateProfileView()
    }
    
    func makeUI() {
        homeScrollView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide.snp.edges)
            $0.width.equalTo(view.snp.width)
        }
    }
    
    func updateProfileView() {
        guard let register = self.register else { return }
        homeScrollView.welcomeLabel.text = "환영합니다. \(register.nickname)님"
        homeScrollView.profileView.playListCountLabel.text = "플레이리스트: \(register.playList.count)개"
        let likeList = register.playList.filter { $0.isLike }
        homeScrollView.profileView.likeCountLabel.text = "좋아요: \(likeList.count)개"
    }
    
    @objc func editProfileButtonClicked() {
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.allowsEditing = true
        present(imagePickerController, animated: true)
    }
    
    @objc func addPlayListButtonClicked() {
        guard let register = self.register else { return }
        guard let heightForRow = self.heightForRow else { return }
        let randomCount = Int.random(in: 1...1000)
        let newMusic = Music(title: "\(randomCount)", artist: "test-artist")
        let realmData = RealmData(realm: realm)
        realmData.addPlayList(identifier: register.identification, newMusic: newMusic)
        filteredData = Array(register.playList)
        homeScrollView.updateUI(height: Int(heightForRow) * register.playList.count)
        updateProfileView()
        homeScrollView.playListTableView.reloadData()
    }
    
    @objc func logoutButtonClicked() {
        guard let loginData = self.loginData else { return }
        guard let register = self.register else { return }
        loginData.loginUpdate(item: register, loginStatus: false)
        
        let entryVC = EntryViewController()
        let navigationVC = UINavigationController(rootViewController: entryVC)
        self.presentedViewController?.navigationController?.popToRootViewController(animated: true)
        self.view.window?.rootViewController = navigationVC
    }
    
    @objc func deleteAccountButtonClicked() {
        guard let realmData = self.realmData else { return }
        guard let register = self.register else { return }
        realmData.delete(register)
        
        let entryVC = EntryViewController()
        let navigationVC = UINavigationController(rootViewController: entryVC)
        self.presentedViewController?.navigationController?.popToRootViewController(animated: true)
        self.view.window?.rootViewController = navigationVC
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let heightForRow = self.heightForRow else { return 0 }
        return heightForRow
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard let register = self.register else { return }
        guard let heightForRow = self.heightForRow else { return }
        
        if editingStyle == .delete {
            let realmData = RealmData(realm: realm)
            realmData.removePlayList(identifier: register.identification, index: indexPath.row)
            self.filteredData = register.getPlayListArray()
            homeScrollView.updateUI(height: Int(heightForRow) * register.playList.count)
            updateProfileView()
            homeScrollView.playListTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PlayListTableViewCell.identifier, for: indexPath) as? PlayListTableViewCell else { return UITableViewCell() }
        
        if let register = self.register {
            let music = filteredData[indexPath.row]
            cell.music = music
        }
        
        let cb: () -> () = {
            self.updateProfileView()
        }
        
        cell.backgroundColor = .clear
        cell.initialSetup()
        cell.makeUI()
        cell.cb = cb
        return cell
    }
}

extension HomeViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else { return }
        guard let register = self.register else { return }
        
        if searchText.isEmpty {
            filteredData = register.getPlayListArray()
        } else {
            let filtered = register.playList.where {
                $0.title.contains(searchText)
            }
            filteredData = Array(filtered)
        }
        
        homeScrollView.playListTableView.reloadData()
    }
}

extension HomeViewController: UISearchBarDelegate {
}

extension HomeViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as? UIImage
        self.homeScrollView.profileView.profileImage.image = image
        dismiss(animated: true)
    }
}
