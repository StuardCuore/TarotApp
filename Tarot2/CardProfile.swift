//
//  CardProfile.swift
//  Tarot2
//
//  Created by stuard bolaños on 01/03/25.
//

import Foundation

struct CardProfile: Hashable {
    let name: String
    let image : String
    static var data: [CardProfile]{[
        .init(name: "Pola", image: "Back"),
        .init(name: "Clow", image: "Clow_Card_Back")]
    }
}
