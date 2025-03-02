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
            //PruebaCard().environmentObject(NumArray())
            //CardView(card: Card.example)
            //CardProfileList()
                
            ContentView().environmentObject(NumArray())
        }
    }
}
