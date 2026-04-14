//
//  ViewController.swift
//  dtfantasy
//
//  Created by Aurimas Petrevicius on 13/04/2026.
//

import GamesLib
import UIKit

class ViewController: GHPOCViewController {

    override var gameId: String {
        "dtfantasy"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    override func onLoginLoginRequest(notification: Notification) {
        
        guard GamingHubCards.isLoggedIn == false else {
            NotificationCenter.default.post(name:.ghLoggedIn, object: nil, userInfo: nil)
            return
        }
        
//        GHIDPManager.auth0.logout() // just in case
        
        GHIDPManager.auth0.login()
    }
    
}
