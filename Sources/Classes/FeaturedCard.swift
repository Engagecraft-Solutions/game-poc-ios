//
//  FeaturedCard.swift
//  dtfantasy
//
//  Created by Aurimas Petrevicius on 13/04/2026.
//

import GamesLib
import SwiftUI
import UIKit

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
    
    /// ask host app to open the game
    func openGame(){
        GamingHubCards.open("dtfantasy", data: nil)
    }
}
