//
//  RealmData.swift
//  Login_SpotifyUI
//
//  Created by 이중엽 on 2023/05/04.
//

import RealmSwift
import UIKit

protocol RealmDataProtocol {
    
}

class RealmData: RealmDataProtocol {
    private let realm: Realm
    
    init(realm: Realm) {
        self.realm = realm
    }
    
    func add(_ data: Register) {
        try! realm.write {
            realm.add(data)
        }
    }
}
