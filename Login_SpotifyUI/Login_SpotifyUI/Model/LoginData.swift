//
//  LoginData.swift
//  Login_SpotifyUI
//
//  Created by 이중엽 on 2023/05/08.
//

import UIKit
import RealmSwift

class LoginData {
    private let realm: Realm
    
    init(realm: Realm) {
        self.realm = realm
    }
    
    func fetch() -> [Register] {
        return Array(realm.objects(Register.self))
    }
    
    func loginUpdate(item: Register, loginStatus: Bool) {
        try! realm.write {
            item.isLogin = loginStatus
            realm.add(item, update: .modified)
        }
    }
}
