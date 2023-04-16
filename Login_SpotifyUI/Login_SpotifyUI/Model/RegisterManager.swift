//
//  RegisterManager.swift
//  Login_SpotifyUI
//
//  Created by 이중엽 on 2023/04/16.
//

import UIKit

class RegisterManager {
    
    static let shared = RegisterManager()
    
    var registerList: [Register] = []
    let count = RegisterManager.shared.registerList.count
    
    func append(_ register: Register) {
        registerList.append(register)
    }
    
    func remove(key: Int) {
        for idx in 0 ..< self.count {
            if registerList[idx].keyNumber == key {
                registerList.remove(at: idx)
                break
            }
        }
    }
    
    func register(key: Int) -> Register? {
        for register in registerList {
            if register.keyNumber == key {
                return register
            }
        }
        return nil
    }
    
    func updatePassword(key: Int, password: String) {
        for idx in 0 ..< self.count {
            if registerList[idx].keyNumber == key {
                registerList[idx].password = password
                break
            }
        }
    }
}
