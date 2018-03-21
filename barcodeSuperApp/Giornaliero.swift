//
//  Giornaliero.swift
//  cerchi
//
//  Created by Davide Compagnone on 19/03/18.
//  Copyright © 2018 Davide Compagnone. All rights reserved.
//

import Foundation


var peso: Double = 85.0
var sesso = "Male"
var età: Int = 26

func calcoloCalorieGiornaliere() -> Double {

    var risultato: Double = 0

    if sesso == "Male" {
        // se è uomo
        switch età {
        case 17..<29:  risultato = 15.3 * peso + 679
        case 29..<59: risultato = 11.6 * peso + 879
        case 59..<74: risultato = 11.9 * peso + 700
        default: risultato = 8.4 * peso + 819

        }

    } else {
        // se è donna

        switch età {
        case 17..<29:  risultato = 14.7 * peso + 496
        case 29..<59: risultato = 8.7 * peso + 829
        case 59..<74: risultato = 9.2 * peso + 688
        default: risultato = 9.8 * peso + 624

        }
    }
    return risultato
}


var calorieConsumate: Double = 0.0

