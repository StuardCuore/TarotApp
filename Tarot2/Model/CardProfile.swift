//
//  CardProfile.swift
//  Tarot2
//
//  Created by stuard bolaños on 01/03/25.
//

import Foundation

// CHANGE THIS TO A ENUM 

struct CardProfile: Hashable { //The struct needs to be of type Hashable so it can be iterated by the forEach loop inside the CardProfileList file
    let name: String
    let image: String
    static var data:[CardProfile] { //this variable is going to CardProfileList file to create a list of buttons so we can change the look of the cards for more than just 2 options.
        [.init(name: "card", image: "cardBack"),
         .init(name: "Clow", image: "Clow_Card_Back"),
         .init(name:"pikisuperstarCard", image:"pikisuperstarCardBack")] //eventually should be added more sets of cards
    }
}


