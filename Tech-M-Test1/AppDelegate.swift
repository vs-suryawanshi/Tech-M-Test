//
//  AppDelegate.swift
//  Tech-M-Test1
//
//  Created by Apps on 25/07/20.
//  Copyright © 2020 Vikramaditya. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
           window = UIWindow(frame: UIScreen.main.bounds)
           window?.backgroundColor = UIColor.white
           let nav = UINavigationController()
           let mainView = ViewController()
           nav.viewControllers = [mainView]
           self.window?.rootViewController = nav
           self.window?.makeKeyAndVisible()
        
        return true
    }


}

