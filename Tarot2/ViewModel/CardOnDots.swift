//
//  CardOnDots.swift
//  Tarot2
//
//  Created by stuard bolaños on 10/07/25.
//

import Foundation

class CardOnDots: ObservableObject {
    
    @Published var  cardOnDot1: Int?
    @Published var  cardOnDot2: Int?
    @Published var  cardOnDot3: Int?
    @Published var  cardOnDot4: Int?
    @Published var  cardOnDot5: Int?
    @Published var  cardOnDot6: Int?
    @Published var  cardOnDot7: Int?
    @Published var  cardOnDot8: Int?
    @Published var  cardOnDot9: Int?
    @Published var dot1Bool = false
    @Published var dot2Bool = false
    @Published var dot3Bool = false
    @Published var dot4Bool = false
    @Published var dot5Bool = false
    @Published var dot6Bool = false
    @Published var dot7Bool = false
    @Published var dot8Bool = false
    @Published var dot9Bool = false
    
    
    
    func TarotReading3Dots (_ card1: String, _ card2: String, _ card3: String) -> String {
        var result: String = """
Eres un intérprete de tarot experimentado y empático. Tu objetivo es proporcionar una lectura de cartas perspicaz y comprensiva.

Se ha realizado una tirada de tres cartas para [nombre de la persona o "un consultante"] que busca claridad sobre [tema específico, ej., "su carrera profesional en los próximos seis meses"].

Las cartas que han aparecido son:
1.  **Pasado/Base:** [\(card1)]
2.  **Presente/Desafío:** [\(card2)]
3.  **Futuro/Resultado:** [\(card3)]

La respuesta debe ser breve y estar estructurada de la siguiente manera: Síntesis General de la Lectura:** (mensaje central) en un párrafo.
"""
        
        
        return result
        
    }
}
