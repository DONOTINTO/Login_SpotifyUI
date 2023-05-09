//
//  SceneDelegate.swift
//  Login_SpotifyUI
//
//  Created by 이중엽 on 2023/04/09.
//

import UIKit
import RealmSwift

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    var realm = try! Realm()
    var loginData: LoginData?
    var isLoginNow: Bool = false
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScence = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScence)
        
        loginData = LoginData(realm: self.realm)
        let registerList = loginData!.fetch()
        var register: Register?
        
        registerList.forEach {
            if $0.isLogin {
                isLoginNow = true
                register = $0
            }
        }
        
        let rootVC = isLoginNow ? HomeViewController() : EntryViewController()
        if let rootVC = rootVC as? HomeViewController {
            rootVC.register = register!
            let navigationVC = UINavigationController(rootViewController: rootVC)
            window?.rootViewController = navigationVC
        } else {
            let navigationVC = UINavigationController(rootViewController: rootVC)
            window?.rootViewController = navigationVC
        }
        
        window?.makeKeyAndVisible()
    }
    
    func presentWindow() -> UIWindow {
        guard let window = self.window else { return UIWindow() }
        return window
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
    
}

