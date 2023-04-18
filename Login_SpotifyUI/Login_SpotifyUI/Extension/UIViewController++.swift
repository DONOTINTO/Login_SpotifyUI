//
//  UIViewController++.swift
//  Login_SpotifyUI
//
//  Created by 이중엽 on 2023/04/18.
//

import UIKit

extension UIViewController {
    func animateView(viewToAnimate: UIView) {
        UIView.animate(withDuration: 0.05, animations: {
            viewToAnimate.transform = CGAffineTransform(scaleX: 0.92, y: 0.92)
        }, completion: { _ in
            UIView.animate(withDuration: 0.1) { viewToAnimate.transform = .identity }
        })
    }
}
