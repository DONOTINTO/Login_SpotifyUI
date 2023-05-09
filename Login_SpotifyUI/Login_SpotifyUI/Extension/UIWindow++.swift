//
//  UIWindow++.swift
//  Login_SpotifyUI
//
//  Created by 이중엽 on 2023/05/09.
//

import UIKit

extension UIWindow {
    func replaceViewController(_ replaceVC: UIViewController, animated: Bool) {
        self.rootViewController = replaceVC
    }
}
