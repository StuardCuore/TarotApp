//
//  Tarot2App.swift
//  Tarot2
//
//  Created by stuard bolaños on 01/03/25.
//

import SwiftUI

@main
struct Tarot2App: App {
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
