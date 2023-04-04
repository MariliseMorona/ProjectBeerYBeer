//
//  AppDelegate.swift
//  ProjectBeerYBeer
//
//  Created by Marilise Morona on 10/05/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
        
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        let vc = LoginViewController()
        
        let navigation = UINavigationController(rootViewController: vc)
        window?.makeKeyAndVisible()
        window?.rootViewController = navigation
        return true
    }
    
}

