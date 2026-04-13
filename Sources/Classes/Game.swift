import GamesLib
import UIKit
import SwiftUI

class Game: GameCard {
    static func viewController(data: [String : Any]?) -> UIViewController? {
        return UIHostingController(rootView: GameBody())
    }
}

struct GameBody: View {
    @State var user: GHUser?
    @State var isLoggedIn = GamingHubCards.isLoggedIn
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 16){
                Text("Hello, I'm the game!")
                Text("Environment: \(GamingHubCards.environment.environment)")
                    .navigationTitle("Fantasy")
                    .toolbar {
                        ToolbarItem(placement: .topBarLeading) {
                            Button {
                                openMenu()
                            } label: {
                                Image(systemName: "line.3.horizontal")
                            }
                            .accessibilityLabel("Open Menu")
                        }
                    }
                
                /// check if user is logged in on Gaming
                if isLoggedIn {
                    /// logged in. You have access to the user info
                    Text("Username: \(user?.username ?? "")")
                    /// user ID
                    Text("UserID: \(user?.uefaId ?? "-")")
                }else{
                    /// not logged in - show login option if needed:
                    Button("Login") {
                        requestLogin()
                    }
                }
            }
            
        }
        .onAppear{
            user = GamingHubCards.user
        }
        .ghOnLoggedIn {
            /// listen to login .ghLoggedIn
            /// in UIKit:
            /*
             NotificationCenter.default.addObserver(self,
                                                    selector: #selector(onLoginLogout(notification:)),
                                                    name: .ghLoggedIn,
                                                    object: nil)
            */
            authorizeWithGameBackend()
            
        }
        .ghOnLoggedOut {
            /// listen to login .ghLoggedOut
            /// in UIKit:
            /*
             NotificationCenter.default.addObserver(self,
                                                    selector: #selector(onLoginLogout(notification:)),
                                                    name: .ghLoggedOut,
                                                    object: nil)
            */
            
            clearGameSession()
        }
    }
    
    /// when user taps menu icon on top left corner of the screen, the game:
    /// - will close in POC
    /// - in final Host app the menu will showup
    private func openMenu() {
        GamingHubCards.openMenu()
    }
    
    /// ask host app to authenticate and autorize the user.
    private func requestLogin() {
        GamingHubCards.login("dtfantasy")
    }
    
    private func authorizeWithGameBackend() {
        user = GamingHubCards.user
        isLoggedIn = GamingHubCards.isLoggedIn
        
        // TODO: Authorize with Game backend
        print("user acceess token:\(GamingHubCards.user.token?.token ?? ".")")
    }

    private func clearGameSession() {
        user = nil
        isLoggedIn = GamingHubCards.isLoggedIn
        
        // TODO: Do whatever is needed to clear and reset game flow when user logs out
    }
}
