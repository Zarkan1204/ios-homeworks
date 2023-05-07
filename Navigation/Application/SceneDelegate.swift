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
        
        let logInViewController = LogInViewController()
        let profileNavigationViewController = UINavigationController(rootViewController: logInViewController)
        profileNavigationViewController.tabBarItem.title = "Profile"
        profileNavigationViewController.tabBarItem.image = UIImage(named: "профиль")
        profileNavigationViewController.navigationBar.isHidden = true
        
        
        let tabViewController = UITabBarController()
        tabViewController.viewControllers = [feedNavigationViewController, profileNavigationViewController]
        tabViewController.tabBar.backgroundColor = .systemGray6
        tabViewController.tabBar.unselectedItemTintColor = .gray
        tabViewController.tabBar.layer.borderWidth = 0.5
        tabViewController.tabBar.layer.borderColor = UIColor.gray.cgColor
        tabViewController.tabBar.tintColor = #colorLiteral(red: 0.2823529412, green: 0.5215686275, blue: 0.8, alpha: 1)
        
        window.rootViewController = tabViewController
        self.window = window
        window.makeKeyAndVisible()
    }
}

