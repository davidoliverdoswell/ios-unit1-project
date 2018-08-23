//
//  AppDelegate.swift
//  Library
//
//  Created by David Oliver Doswell on 8/21/18.
//  Copyright © 2018 David Oliver Doswell. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let homeViewController = HomeViewController()
        
        let navigationController = UINavigationController(rootViewController: homeViewController)
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }
}

