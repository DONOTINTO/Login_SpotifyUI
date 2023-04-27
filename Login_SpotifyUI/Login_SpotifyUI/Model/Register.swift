//
//  Register.swift
//  Login_SpotifyUI
//
//  Created by 이중엽 on 2023/04/16.
//

import UIKit

struct Register {
    var identification: String
    var nickName: String
    var password: String
    var phone: String
    var keyNumber = Int.random(in: 1...999999)
}
