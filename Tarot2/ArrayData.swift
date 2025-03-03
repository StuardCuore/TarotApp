//
//  ArrayData.swift
//  Tarot2
//
//  Created by stuard bolaños on 01/03/25.
//

import Foundation
import SwiftUI

//public var tarotArray = Array(1...22) // is not necesary necesary


class NumArray: ObservableObject {
    
    
    //@Published var isLoggedIn = false //Por el momento no ha afectado remover esta variable.
    @Published var zInd: Double = 1 // Change to Int
    @Published var zVar: Double = 1 // Change to Int
    @Published var cardBackSet1:String = ""// this needs a refactor to get the name out of the card struct
    @Published var cardBackSet2:String = "Clow_Card_"// this needs a refactor to get the name out of the card struct
    @Published var cardBack:String = ""// this needs a refactor to get the name out of the card struct
    
    @Published var cardSet1:String = "card"// this needs a refactor to get the name out of the card struct
    @Published var cardSet2:String = "Clow"// this needs a refactor to get the name out of the card struct
    @Published var cardSet:String = "card" // this needs a refactor to get the name out of the card struct
    @Published var clowCards = false // This needs to be REFACTORED so is able to change to other card sets.
    @Published var shuffledCardIndex:Array = Array(1...22) //does the same as a 1 to 22 regular array [1,2,3...22]
    
    
}

