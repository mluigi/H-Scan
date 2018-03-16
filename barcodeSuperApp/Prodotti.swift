//
//  Prodotti.swift
//  barcodeSuperApp
//
//  Created by Alberto Quassone on 15/03/18.
//  Copyright © 2018 Luigi Marrandino. All rights reserved.
//

import Foundation
import UIKit



class Prodotto {
    var nome: String
    var immagine: UIImage
    var calorie: Int
    var quantità: Int
    var proprietàNutrizionali: String?
    
    
    init(nome: String, immagine: UIImage, calorie: Int, quantità: Int, proprietàNutrizionali: String?) {
        self.nome = nome
        self.immagine = immagine
        self.calorie = calorie
        self.quantità = quantità
        self.proprietàNutrizionali = proprietàNutrizionali
    }
    
}

var MilkaChocoBrownie = Prodotto(nome: "Milka Choco Brownie", immagine: #imageLiteral(resourceName: "milkaChocoBrownie"), calorie: 118*2, quantità: 2, proprietàNutrizionali: nil)
var KinderBueno = Prodotto(nome: "Kinder Bueno", immagine: #imageLiteral(resourceName: "kinderBueno"), calorie: 122*2, quantità: 2, proprietàNutrizionali: nil)
var KinderCereali = Prodotto(nome: "barretta Kinder Cereali", immagine: #imageLiteral(resourceName: "kinderCereali"), calorie: 132, quantità: 1, proprietàNutrizionali: nil)
var KitKat = Prodotto(nome: "Kit-Kat", immagine: #imageLiteral(resourceName: "kitkat"), calorie: 209*4, quantità: 4, proprietàNutrizionali: nil)
var Bounty = Prodotto(nome: "bounty", immagine: #imageLiteral(resourceName: "bounty"), calorie: 139*2, quantità: 2, proprietàNutrizionali: nil)
var Mars = Prodotto(nome: "Mars", immagine: #imageLiteral(resourceName: "mars"), calorie: 182, quantità: 1, proprietàNutrizionali: nil)
var Snickers = Prodotto(nome: "Snickers", immagine: #imageLiteral(resourceName: "snickers"), calorie: 256, quantità: 1, proprietàNutrizionali: nil)
var KinderColazionePiù = Prodotto(nome: "Kinder Colazione Più (pack of 10 pieces)"
, immagine: #imageLiteral(resourceName: "kindercolazionepiu"), calorie: 122, quantità: 1, proprietàNutrizionali: nil)
var Cerealix = Prodotto(nome: "Cerealix (pack of 8 pieces)", immagine: #imageLiteral(resourceName: "cerealix"), calorie: 96, quantità: 1, proprietàNutrizionali: nil)







var Mela = Prodotto(nome: "Mela", immagine: #imageLiteral(resourceName: "mela"), calorie: 60, quantità: 1, proprietàNutrizionali: "Aiuta nella prevenzione del cancro, regola i livelli di diabete, abbassa il colesterolo nel sangue")
var Pera = Prodotto(nome: "Pera", immagine: #imageLiteral(resourceName: "pera"), calorie: 45, quantità: 1, proprietàNutrizionali: "Migliora la digestione, abbassa i livelli di colesterolo nel sangue")
var Arancia = Prodotto(nome: "Arancia", immagine: #imageLiteral(resourceName: "arancia"), calorie: 50, quantità: 1, proprietàNutrizionali: "Rafforza le difese immunitarie, previene i calcoli renali")



var alternative = [Mela,Pera,Arancia]

var dizionario : [Int:Prodotto] = [
    7622210788078:MilkaChocoBrownie,
    80052760:KinderBueno,
    80310266:KinderCereali,
    7613035220065:KitKat,      //non sicuro
    40111216:Bounty,     //non sicuro
    5000159407236:Mars,
    5000159461122:Snickers,
    8000500033715:KinderColazionePiù,
    8013355998665:Cerealix
    

]







//func sceltaAlternative (_ alternative:[Prodotto]) -> [Prodotto] {
//    var alternativescelte = [Prodotto]()
//    var index=0
//    while index < 2 {
//        let randomnumber = Int(arc4random_uniform(UInt32(alternative.count)+1))
//        alternativescelte.append(alternative[randomnumber])
//        index += 1
//    }
//    return alternativescelte
//
//
//
//}





