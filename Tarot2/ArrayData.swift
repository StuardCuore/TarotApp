//
//  ArrayData.swift
//  Tarot2
//
//  Created by stuard bolaños on 01/03/25.
//

import Foundation
import SwiftUI

public var tarotArray = Array(1...22)


class NumArray: ObservableObject {
    
    
    @Published var isLoggedIn = true //regresar a false
    @Published var zInd: Double = 1
    @Published var zVar: Double = 1
    @Published var cardBackSet1:String = ""
    @Published var cardBackSet2:String = "Clow_Card_"
    
    
    @Published var cardBack:String = ""
    @Published var cardSet1:String = "card"
    @Published var cardSet2:String = "Clow"
    @Published var cardSet:String = "card"
    @Published var clowCards = false
    @Published var shuffledCardIndex:Array = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22]
    
    
}

