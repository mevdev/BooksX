//
//  SceneDelegate.swift
//  BooksX
//
//  Created by Robert Linnemann on 8/1/20.
//  Copyright © 2020 Robert Linnemann. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        let navController = UINavigationController()
        navController.setNavigationBarHidden(true, animated: false)
        navController.viewControllers = [BooksViewController()]
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
    }

}

