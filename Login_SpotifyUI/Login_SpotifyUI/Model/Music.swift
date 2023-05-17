//
//  Music.swift
//  Login_SpotifyUI
//
//  Created by 이중엽 on 2023/04/28.
//

import Foundation
import RealmSwift

class Music: Object {
    @Persisted var title: String
    @Persisted var artist: String
    @Persisted var isLike: Bool = true
    
    convenience init(title: String, artist: String) {
        self.init()
        self.title = title
        self.artist = artist
    }
}
