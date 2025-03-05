//
//  Card.swift
//  Tarot2
//
//  Created by stuard bolaños on 01/03/25.
//

import Foundation


struct Card {
    
    let front: Int //name of the cards should end with a number starting from 1 to be setted by this constant.
    let back = "Back" 
    let booly = Bool.random() //this is what makes the card appear (or not) upside down.
    
    //static let example = Card(front: 1)
    static let example2 = Card(front: 1) //an example of the struct itself used to be passed in a view since the front constant is not defined.
}
