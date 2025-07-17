//
//  Card.swift
//  Tarot2
//
//  Created by stuard bolaños on 01/03/25.
//

import Foundation



struct Card {
    
    let front: Int //name of the cards should end with a number starting from 1 to be setted by this constant.
    let back = "Back" // name of the back of the cards should always end with "Back"
    let booly = Bool.random() //this is what makes the card appear (or not) upside down.
    
    static let example = Card(front: 1) //an example of the struct itself used to be passed in a view since the front constant is not defined.
}


enum CardIDToText: Int, CaseIterable { // CaseIterable is useful for iterating over all cases
    case theFool = 1
    case theMagician
    case theHighPriestess
    case theEmpress
    case theEmperor
    case theHierophant
    case theLovers
    case theChariot
    case strength
    case theHermit
    case theWheelOfFortune
    case justice
    case theHangedMan
    case death
    case temperance
    case theDevil
    case theTower
    case theStar
    case theMoon
    case theSun
    case judgement
    case theWorld

    var description: String {
        switch self {
        case .theFool: return "The Fool"
        case .theMagician: return "The Magician"
        case .theHighPriestess: return "The High Priestess"
        case .theEmpress: return "The Empress"
        case .theEmperor: return "The Emperor"
        case .theHierophant: return "The Hierophant"
        case .theLovers: return "The Lovers"
        case .theChariot: return "The Chariot"
        case .strength: return "Strength"
        case .theHermit: return "The Hermit"
        case .theWheelOfFortune: return "The Wheel of Fortune"
        case .justice: return "Justice"
        case .theHangedMan: return "The Hanged Man"
        case .death: return "Death"
        case .temperance: return "Temperance"
        case .theDevil: return "The Devil"
        case .theTower: return "The Tower"
        case .theStar: return "The Star"
        case .theMoon: return "The Moon"
        case .theSun: return "The Sun"
        case .judgement: return "Judgement"
        case .theWorld: return "The World"
        }
    }

}
