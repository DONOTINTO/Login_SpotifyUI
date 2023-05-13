//
//  RealmData.swift
//  Login_SpotifyUI
//
//  Created by 이중엽 on 2023/05/04.
//

import RealmSwift
import UIKit

protocol RealmDataProtocol {
    func fetch() -> [Register]
    func add(_ data: Register)
}

class RealmData: RealmDataProtocol {
    private let realm: Realm
    
    init(realm: Realm) {
        self.realm = realm
    }
    
    func fetch() -> [Register] {
        return Array(realm.objects(Register.self))
    }
    
    func add(_ data: Register) {
        try! realm.write {
            realm.add(data)
        }
    }
    
    func addPlayList(identifier: String, newMusic: Music) {
        try! realm.write {
            guard let object = realm.object(ofType: Register.self, forPrimaryKey: identifier) else { return }
            object.playList.append(newMusic)
        }
    }
    
    func removePlayList(identifier: String, index: Int) {
        try! realm.write {
            guard let object = realm.object(ofType: Register.self, forPrimaryKey: identifier) else { return }
            object.playList.remove(at: index)
        }
    }
    
    func toggleisLike(music: Music, isLike: Bool) {
        try! realm.write {
            music.isLike = isLike
        }
    }
}
