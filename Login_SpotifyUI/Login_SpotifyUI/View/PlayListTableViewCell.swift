//
//  PlayListTableViewCell.swift
//  Login_SpotifyUI
//
//  Created by 이중엽 on 2023/04/26.
//

import UIKit
import SnapKit

class PlayListTableViewCell: UITableViewCell {
    static let identifier = "playListCell"
    
    let titleLabel = UILabel()
    let nameLabel = UILabel()
    let likeButton = UIButton()
    var music: Music?
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        self.backgroundColor = .clear
    }
    
    func initialSetup() {
        guard let music = self.music else { return }
        
        [titleLabel, nameLabel, likeButton].forEach { contentView.addSubview($0) }
        self.contentView.backgroundColor = ProjColor.green
        
        titleLabel.text = music.title
        titleLabel.font = ProjFont.metro22
        titleLabel.textColor = .white
        titleLabel.textAlignment = .left
        
        nameLabel.text = music.artist
        nameLabel.font = ProjFont.metro15
        nameLabel.textColor = .white
        nameLabel.textAlignment = .left
        
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 40, weight: .light)
        let likeImage = UIImage(systemName: "heart.fill", withConfiguration: imageConfig)
        let unlikeImage = UIImage(systemName: "heart", withConfiguration: imageConfig)
        likeButton.tintColor = .white

        if music.isLike {
            likeButton.setImage(likeImage, for: .normal)
        } else {
            likeButton.setImage(unlikeImage, for: .normal)
        }
    }
    
    func makeUI() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top).offset(10)
            $0.leading.equalTo(contentView.snp.leading).offset(10)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(5)
            $0.leading.equalTo(contentView.snp.leading).offset(10)
        }
        
        likeButton.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top).offset(10)
            $0.trailing.equalTo(contentView.snp.trailing).offset(-10)
            $0.bottom.equalTo(contentView.snp.bottom).offset(-10)
        }
    }
}
