/* lecturas.swift --> Hackathon. Created by BaymaxCoders on 25/04/23. */

import Foundation

class Lectura {
    var texto: String
    var fecha: Date
    
    init(texto: String) {
        self.texto = texto
        self.fecha = Date()
    }
}

var lecturas: [Lectura] = []
