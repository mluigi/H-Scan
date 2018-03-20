//
//  Prodotti.swift
//  barcodeSuperApp
//
//  Created by Alberto Quassone on 15/03/18.
//  Copyright © 2018 Luigi Marrandino. All rights reserved.
//


import UIKit

class Product {
    var name: String = ""
    var image: UIImage
    var calories: Float = 0
    var pieces: Int = 0
    var nutritionalProprieties: String?
    var count = 0

    init(name: String, image: UIImage, calories: Float, pieces: Int) {
        self.name = name
        self.image = image
        self.calories = calories
        self.pieces = pieces
    }

    init(name: String, image: UIImage, calories: Float, pieces: Int, nutritionalProprieties: String?) {
        self.name = name
        self.image = image
        self.calories = calories
        self.pieces = pieces
        self.nutritionalProprieties = nutritionalProprieties
    }
}

var MilkaChocoBrownie = Product(name: "Milka Choco Brownie", image: #imageLiteral(resourceName:"milkaChocoBrownie"), calories: 118, pieces: 2)
var KinderBueno = Product(name: "Kinder Bueno", image: #imageLiteral(resourceName:"kinderBueno"), calories: 122, pieces: 2)
var KinderCereali = Product(name: "barretta Kinder Cereali", image: #imageLiteral(resourceName:"kinderCereali"), calories: 132, pieces: 1)
var KitKat = Product(name: "Kit-Kat", image: #imageLiteral(resourceName:"kitkat"), calories: 209, pieces: 4)
var Bounty = Product(name: "bounty", image: #imageLiteral(resourceName:"bounty"), calories: 139, pieces: 2)
var Mars = Product(name: "Mars", image: #imageLiteral(resourceName:"mars"), calories: 182, pieces: 1)
var Snickers = Product(name: "Snickers", image: #imageLiteral(resourceName:"snickers"), calories: 256, pieces: 1)
var KinderColazionePiù = Product(name: "Kinder Colazione Più (pack of 10 pieces)"
        , image: #imageLiteral(resourceName:"kindercolazionepiu"), calories: 122, pieces: 1)
var Cerealix = Product(name: "Cerealix", image: #imageLiteral(resourceName:"cerealix"), calories: 96, pieces: 8)
var Buondi = Product(name: "Buondi Cioccolato", image: #imageLiteral(resourceName:"buondi"), calories: 126, pieces: 6)
var KinderDelice = Product(name: "Kinder Delice", image: #imageLiteral(resourceName:"kinderDelice"), calories: 185, pieces: 10)
var CrackersIntegraliMulinoBianco = Product(name: "Crackers Integrali Mulino Bianco", image: #imageLiteral(resourceName:"crackers"), calories: 104, pieces: 20)
var Ringo = Product(name: "Ringo", image: #imageLiteral(resourceName: "ringo"), calories: 46.10, pieces: 6)


var Apple = Product(name: "Apple", image: #imageLiteral(resourceName:"mela"), calories: 60, pieces: 1, nutritionalProprieties: "Helps in cancer prevention, regulates diabetes levels, lower cholesterol")
var Pear = Product(name: "Pear", image: #imageLiteral(resourceName:"pera"), calories: 45, pieces: 1, nutritionalProprieties: "Improves digestion, lowers cholesterol levels in the blood")
var Orange = Product(name: "Orange", image: #imageLiteral(resourceName:"arancia"), calories: 50, pieces: 1, nutritionalProprieties: "Strengthens the immune system, prevents kidney stones")


var alternatives = [Apple, Pear, Orange]

var dictionary: [String: Product] = [
    "7622210788078": MilkaChocoBrownie,
    "80052760": KinderBueno,
    "80310266": KinderCereali,
    "7613035220065": KitKat, //non sicuro
    "40111216": Bounty, //non sicuro
    "5000159407236": Mars,
    "5000159461122": Snickers,
    "8000500033715": KinderColazionePiù,
    "80550501": Cerealix,
    "8014037008634": Buondi,
    "8000500267103": KinderDelice,
    "8076809516655": CrackersIntegraliMulinoBianco,
    "80509066" : Ringo
]


var temp: Product!
