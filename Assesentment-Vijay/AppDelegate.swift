//
//  AppDelegate.swift
//  Assesentment-Vijay
//
//  Created by Vijay Singh Raghav on 20/09/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        launchApp()
        return true
    }

    
    final func launchApp() {
        window = UIWindow()
        let homeVC = WeatherVC.instantiate(storyboard: .main)
        let navigationVC = UINavigationController(rootViewController: homeVC)
        navigationVC.setNavigationBarHidden(true, animated: false)
        window?.rootViewController = navigationVC
        window?.makeKeyAndVisible()
    }

}

