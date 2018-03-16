//
//  Prodotti.swift
//  barcodeSuperApp
//
//  Created by Alberto Quassone on 15/03/18.
//  Copyright © 2018 Luigi Marrandino. All rights reserved.
//


import UIKit

class Product {
    var name: String! = ""
    var image: UIImage!
    var calories: Int = 0
    var pieces: Int = 0
    var nutritionalProprieties: String?

    init(name: String, image: UIImage, calories: Int, pieces: Int, nutritionalProprieties: String?) {
        self.name = name
        self.image = image
        self.calories = calories
        self.pieces = pieces
        self.nutritionalProprieties = nutritionalProprieties
        
    }
    
    
}

var MilkaChocoBrownie = Product(name: "Milka Choco Brownie", image: #imageLiteral(resourceName:"milkaChocoBrownie"), calories: 118 * 2, pieces: 2, nutritionalProprieties: nil)
var KinderBueno = Product(name: "Kinder Bueno", image: #imageLiteral(resourceName:"kinderBueno"), calories: 122 * 2, pieces: 2, nutritionalProprieties: nil)
var KinderCereali = Product(name: "barretta Kinder Cereali", image: #imageLiteral(resourceName:"kinderCereali"), calories: 132, pieces: 1, nutritionalProprieties: nil)
var KitKat = Product(name: "Kit-Kat", image: #imageLiteral(resourceName:"kitkat"), calories: 209 * 4, pieces: 4, nutritionalProprieties: nil)
var Bounty = Product(name: "bounty", image: #imageLiteral(resourceName:"bounty"), calories: 139 * 2, pieces: 2, nutritionalProprieties: nil)
var Mars = Product(name: "Mars", image: #imageLiteral(resourceName:"mars"), calories: 182, pieces: 1, nutritionalProprieties: nil)
var Snickers = Product(name: "Snickers", image: #imageLiteral(resourceName:"snickers"), calories: 256, pieces: 1, nutritionalProprieties: nil)
var KinderColazionePiù = Product(name: "Kinder Colazione Più (pack of 10 pieces)"
        , image: #imageLiteral(resourceName:"kindercolazionepiu"), calories: 122, pieces: 1, nutritionalProprieties: nil)
var Cerealix = Product(name: "Cerealix (pack of 8 pieces)", image: #imageLiteral(resourceName:"cerealix"), calories: 96, pieces: 1, nutritionalProprieties: nil)
var Buondi = Product(name:"Buondi Cioccolato (pack of 6 pieces)", image: #imageLiteral(resourceName: "buondi"), calories: 126, pieces: 1, nutritionalProprieties: nil)
var KinderDelice = Product(name: "Kinder Delice (pack of 10 pieces)", image: #imageLiteral(resourceName: "kinderDelice"), calories: 185, pieces: 1, nutritionalProprieties: nil)
var CrackersIntegraliMulinoBianco = Product(name: "Crackers Integrali Mulino Bianco (pack of 20 pieces)", image: #imageLiteral(resourceName: "crackers"), calories: 104, pieces: 1, nutritionalProprieties: nil)






var Apple = Product(name: "Apple", image: #imageLiteral(resourceName:"mela"), calories: 60, pieces: 1, nutritionalProprieties: "Helps in cancer prevention, regulates diabetes levels, lower cholesterol")
var Pear = Product(name: "Pear", image: #imageLiteral(resourceName:"pera"), calories: 45, pieces: 1, nutritionalProprieties: "Improves digestion, lowers cholesterol levels in the blood")
var Orange = Product(name: "Orange", image: #imageLiteral(resourceName:"arancia"), calories: 50, pieces: 1, nutritionalProprieties: "Strengthens the immune system, prevents kidney stones")




var alternatives = [Apple, Pear, Orange]

var dictionary: [Int: Product] = [
    7622210788078: MilkaChocoBrownie,
    80052760: KinderBueno,
    80310266: KinderCereali,
    7613035220065: KitKat, //non sicuro
    40111216: Bounty, //non sicuro
    5000159407236: Mars,
    5000159461122: Snickers,
    8000500033715: KinderColazionePiù,
    8013355998665: Cerealix,
    8014037008634: Buondi,
    8000500267103: KinderDelice,
    8076809516655: CrackersIntegraliMulinoBianco
]


//func pickAnAlternative (_ alternatives:[Product]) -> [Product] {
//    var pickedalternatives = [Product]()
//    var index=0
//    while index < 2 {
//        let randomnumber = Int(arc4random_uniform(UInt32(alternatives.count)+1))
//        pickedalternatives.append(alternative[randomnumber])
//        index += 1
//    }
//    return pickedalternatives
//
//}





