//
//  AppDelegate.swift
//  XDKitDemo
//
//  Created by dyw on 2022/4/25.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = MineTabBarController()
        window?.makeKeyAndVisible()
        return true
    }

}

