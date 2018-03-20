//
//  DBController.swift
//  barcodeSuperApp
//
//  Created by Luigi Marrandino on 12/03/18.
//  Copyright © 2018 Luigi Marrandino. All rights reserved.
//

import UIKit

let DB = UserDefaults()
let recentProds = "recentProducts"
let dailyCalories = ""
extension UserDefaults {
    func saveProduct(_ barcode: String) {
        var products = recentProducts() ?? [String]()
        if !products.contains(barcode) {
            products.append(barcode)
        }
        set(products, forKey: recentProds)
        synchronize()
    }
    
    func recentProducts() -> [String]? {
        return array(forKey: recentProds) as! [String]?
    }
 }
