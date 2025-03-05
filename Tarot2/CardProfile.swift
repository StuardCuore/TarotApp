//
//  CardProfile.swift
//  Tarot2
//
//  Created by stuard bolaños on 01/03/25.
//

import Foundation

struct CardProfile: Hashable { //The struct needs to be of type Hashable so it can be iterated by the forEach loop inside the CardProfileList file
    let name: String
    let image: String
    static var data:[CardProfile] { //this variable is going to CardProfileList file to create a list of buttons so we can change the look of the cards for more than just 2 options.
        [.init(name: "Pola", image: "Back"),
         .init(name: "Clow", image: "Clow_Card_Back")] //eventually should be added more sets of cards
    }
}
