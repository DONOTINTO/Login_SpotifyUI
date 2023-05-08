//
//  LoginData.swift
//  Login_SpotifyUI
//
//  Created by 이중엽 on 2023/05/08.
//

import UIKit
import RealmSwift
///Users/goods99j/Library/Developer/CoreSimulator/Devices/79EA4DDB-3E32-4C19-BB8B-5CC1D8079D43/data/Containers/Data/Application/
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
