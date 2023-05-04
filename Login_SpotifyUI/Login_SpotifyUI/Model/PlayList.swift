//
//  PlayList.swift
//  Login_SpotifyUI
//
//  Created by 이중엽 on 2023/04/28.
//

import Foundation
import RealmSwift

class PlayList: Object {
    // @Persisted var list: List<Music> = [Music(title: "How deep?", artist: "Tai Verdes")]
    @Persisted var list = List<Music>()
}
