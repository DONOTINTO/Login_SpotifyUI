//
//  Register.swift
//  Login_SpotifyUI
//
//  Created by 이중엽 on 2023/04/16.
//

import UIKit

struct Register {
    let identification: String
    let password: String
    let phone: String
    let keyNumber: Int
    
    init(identification: String, password: String, phone: String, keyNumber: Int) {
        self.identification = identification
        self.password = password
        self.phone = phone
        self.keyNumber = keyNumber
    }
}
