//
//  CardOptionsModel.swift
//  Tarot2
//
//  Created by stuard bolaños on 08/03/25.
//

import Foundation

enum CardOptionsModel: Int, CaseIterable {
    case card
    case ClowCard
    case pikisuperstarCard
    
    var frontTitle: String {
        switch self {
            case .card: return "card"
            case .ClowCard: return "Clow"
            case .pikisuperstarCard: return "pikisuperstarCard"
        }
    }
    var backTitle: String {
        switch self {
        case .card: return "Back"
        case .ClowCard: return "Clow_Card_Back"
        case .pikisuperstarCard: return "pikisuperstarCardBack"
        }
    }
}

extension CardOptionsModel: Identifiable {  // This extensions is so the CardOptionsModel can be iterated through a forEach loop since the loop os going to ask for an id
    var id: Int {return self.rawValue} // The rawValue is the Int given in the type of the enum, is set automaticaly 
}
