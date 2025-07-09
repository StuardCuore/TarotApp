//
//  ArrayData.swift
//  Tarot2
//
//  Created by stuard bolaños on 01/03/25.
//

import Foundation
import SwiftUI

class ArrayData: ObservableObject {

    @Published var zInd: Int = 1
    @Published var zVar: Int = 1
    @Published var cardBack:String = "cardBack"// this needs a refactor to get the name out of the card struct
    
    @Published var cardSet:String = "card" // this needs a refactor to get the name out of the card struct
    @Published var shuffledCardIndex:Array = Array(1...22) //does the same as a 1 to 22 hard coded regular array [1,2,3...22]
    
    
    func resetShuffleCards(cards: [Card]){
        var i = 0
        var emptyArray = [Int]()
        let cardsCount = cards.count
        self.shuffledCardIndex = [Int]()
        
        while i < cardsCount {
            let inte = Int(cards[i].front)
            emptyArray.append(inte) //emptyArray.insert(inte, at:i)
            i += 1
        }
        self.shuffledCardIndex = emptyArray.reversed()
    }
    
}

