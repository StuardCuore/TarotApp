//
//  Tarot2App.swift
//  Tarot2
//
//  Created by stuard bolaños on 01/03/25.
//

import SwiftUI
import FirebaseCore
import FirebaseVertexAI

//added from firebase
/*class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}*/
//added from firebase


@main
struct Tarot2App: App {
    
    // register app delegate for Firebase setup
    //@UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    // register app delegate for Firebase setup
    
    //added from gemini
    init() {
            FirebaseApp.configure()
        }
    //aded from gemini
    
    var body: some Scene {
        WindowGroup {
            /* all this views aren't working anymore. They use to be tests
             
            //PruebaCard().environmentObject(ArrayData())
            //CardView(card: Card.example2)
            //CardProfileList()
             
             */
                
            ContentView().environmentObject(ArrayData()) //current view that should be active.
                .environmentObject(SideMenuData())
        }
    }
}
