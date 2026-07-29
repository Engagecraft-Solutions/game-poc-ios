//
//  FeaturedCard.swift
//  dtfantasy
//
//  Created by Aurimas Petrevicius on 13/04/2026.
//

import GamesLib
import SwiftUI
import UIKit

/// 5. 5. Featured card - provide Game Featured card to the Host to be added into home feed
/// This is the main  class to the game's featured card. It has to be named FeaturedCard and conform to GameCard protocol
class FeaturedCard: GameCard{
    static func viewController(data: [String : Any]?) -> UIViewController? {
        return UIHostingController(rootView: CardBody())
    }

}


struct CardBody: View {
    
    var body: some View {
        Button{
            openGame()
        }label:{
            VStack{
                Text("Hello, I'm featured card")
                if GamingHubCards.isLoggedIn {
                    // user name
                    Text("User: \(GamingHubCards.user.username)")
                    // UserID
                    Text("UserID: \(GamingHubCards.user.uefaId ?? "-")")
                }
            }
            .frame(height: 220)
            .frame(maxWidth: .infinity)
        }
    }
    
    /// 6. Open Game Request - Featured card asks the Host app to open the game.
    /// ask host app to open the game
    func openGame(){
        /// ask host to open the game providing game id ("eplhigherlower", in this case)
        /// if needed, additional data: [String: Any] can be provided to game
        GamingHubCards.open("eplhigherlower", data: nil)
    }
}
