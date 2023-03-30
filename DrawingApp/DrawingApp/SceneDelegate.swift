//
//  SceneDelegate.swift
//  DrawingApp
//
//  Created by Noah on 2023/03/27.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let _ = scene as? UIWindowScene
        else { return }
    }
}
