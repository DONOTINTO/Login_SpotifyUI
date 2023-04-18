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
    
    func append(_ register: Register) {
        registerList.append(register)
    }
    
    func remove(key: Int) {
    
        if let index = registerList.firstIndex(where: { $0.keyNumber == key }) {
            registerList.remove(at: index)
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
        if let index = registerList.firstIndex(where: { $0.keyNumber == key}) {
            registerList[index].password = password
        }
     }
}
