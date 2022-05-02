//
//  AppDelegate.swift
//  No BS Dictionary
//
//  Created by Dean Thompson on 2022/03/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    let homeVC = MainViewController()

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        let NC = UINavigationController(rootViewController: homeVC)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        window?.rootViewController = NC
        
        return true
    }



}

