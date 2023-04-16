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
        for register in registerList {
            var idx = 0
            
            if register.keyNumber == key {
                registerList.remove(at: idx)
                break
            }
            idx += 1
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
        for register in registerList {
            var idx = 0
            
            if register.keyNumber == key {
                //register가 let인 이유를 모르겠음
                register.password = password
                break
            }
            idx += 1
        }
    }
}
