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
    var consentManager: SourcePointCM?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        consentManager = SourcePointCM()
        consentManager?.startPOC()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        consentManager?.checkAndOpen(in: self) {
            print("user Consent \(AdsConsentManager.consent)")
        }
    }

    
    override func onLoginLoginRequest(notification: Notification) {
        
        guard GamingHubCards.isLoggedIn == false else {
            NotificationCenter.default.post(name:.ghLoggedIn, object: nil, userInfo: nil)
            return
        }
        
//        GHIDPManager.auth0.logout() // just in case
        
        GHIDPManager.auth0.login()
    }
    
    
    // MARK: DEEPLINK POC
    
    /// deep link usually consists of the following parts:
    /// domain
    /// language segment
    ///  game id  segment - for the host to know to which game the link is addressed
    ///  extra path segmens/parameters - for internal game logic
    let deeplink = "https://dreamteam-domain/en/dtfantasy/pathparameters"
    
    
    
    
    
    /// Simulate "game listening" to deep link:
    /// opens the game
    /// waits for 3 seconds
    /// send the deeplink
    @IBAction func openGameWithDeeplinkDelay(_ sender: Any) {
        
        GamingHubCards.open(gameId)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3){
            NotificationCenter.default.post(name: .ghOpenLink, object: nil, userInfo: ["link": self.deeplink])
        }
    }
    
    @IBAction func openGameWithDeeplink(_ sender: Any) {
        GamingHubCards.open(gameId, data: ["link": self.deeplink])
    }
    
}
