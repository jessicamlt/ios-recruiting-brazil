//
//  AppDelegate.swift
//  Movs
//
//  Created by Jéssica Trindade on 31/08/20.
//  Copyright © 2020 Jéssica Trindade. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let screenFrame = UIScreen.main.bounds
        
        window = UIWindow(frame: screenFrame)
        
        
        let mainScreenViewController = MainScreenViewController()
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [mainScreenViewController]
        
        let mainScreenTabBarItem = UITabBarItem(title: "Movies", image: UIImage(named:"list_icon"), tag: 0)
        mainScreenTabBarItem.badgeColor = .darkGray
        mainScreenViewController.tabBarItem = mainScreenTabBarItem
        
        let navigationController = UINavigationController(rootViewController: tabBarController)
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }

   


}

