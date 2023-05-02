//
//  Music.swift
//  Login_SpotifyUI
//
//  Created by 이중엽 on 2023/04/28.
//

import Foundation

class Music {
    var title: String
    var artist: String
    var isLike: Bool = true
    
    init(title: String, artist: String) {
        self.title = title
        self.artist = artist
    }
    
    func toggleIsLike() {
        isLike.toggle()
    }
}
