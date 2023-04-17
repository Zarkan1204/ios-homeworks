//
//  SceneDelegate.swift
//  Navigation
//
//  Created by Мой Macbook on 07.04.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
     
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        
        let feedViewController = FeedViewController()
        let feedNavigationViewController = UINavigationController(rootViewController: feedViewController)
        feedViewController.tabBarItem.title = "News"
        feedViewController.tabBarItem.image = UIImage(named: "лента")
        
        let profileViewController = ProfileViewController()
        let profileNavigationViewController = UINavigationController(rootViewController: profileViewController)
        profileNavigationViewController.tabBarItem.title = "Profile"
        profileNavigationViewController.tabBarItem.image = UIImage(named: "профиль")
        
        let tabViewController = UITabBarController()
        tabViewController.viewControllers = [feedNavigationViewController, profileNavigationViewController]
        tabViewController.tabBar.backgroundColor = #colorLiteral(red: 0.639077723, green: 0.2492567599, blue: 0.6254395843, alpha: 1)
        tabViewController.tabBar.unselectedItemTintColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        tabViewController.tabBar.layer.borderWidth = 0.5
        tabViewController.tabBar.layer.borderColor = UIColor.gray.cgColor
        tabViewController.tabBar.tintColor = .white
        
        window.rootViewController = tabViewController
        self.window = window
        window.makeKeyAndVisible()
    }
}

