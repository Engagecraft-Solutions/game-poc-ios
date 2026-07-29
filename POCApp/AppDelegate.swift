//
//  AppDelegate.swift
//  eplhigherlower
//
//  Created by Aurimas Petrevicius on 13/04/2026.
//

import UIKit
import GamesLib
import Combine

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let config : [String: Any] = ["languages": ["en"],
                                      "api": "dreamteam",
                                      "grant": "auth0"]
        GamingHubCards
            .setupPOC(competition: GamingHubCompetitions.main.rawValue, environment: .preproduction, clientId: "DT_APP_IOS", config: config)
        
        NotificationCenter.default.addObserver(self, selector: #selector(onGameLink(_:)), name: .ghOpenGameLink, object: nil)
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    @objc func onGameLink(_ notification: Notification){
        print("HOST Got link from game to open: \(notification.userInfo?["link"] as? String ?? "-")")
        if let link = notification.userInfo?["link"] as? String,
           let url = URL(string: link),
           UIApplication.shared.canOpenURL(url){
           UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }

}

