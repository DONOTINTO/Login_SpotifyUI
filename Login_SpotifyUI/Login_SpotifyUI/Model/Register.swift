//
//  Register.swift
//  Login_SpotifyUI
//
//  Created by 이중엽 on 2023/04/16.
//

import UIKit
import RealmSwift

class Register: Object {
    @Persisted(primaryKey: true) var identification: String
    @Persisted var nickname: String
    @Persisted var password: String
    @Persisted var phone: String
    @Persisted var isLogin: Bool = false
    @Persisted var playList = List<Music>()
    
    convenience init(identification: String, nickname: String, password: String, phone: String) {
        self.init()
        self.identification = identification
        self.nickname = nickname
        self.password = password
        self.phone = phone
    }
}
