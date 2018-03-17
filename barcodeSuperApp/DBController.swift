//
//  DBController.swift
//  barcodeSuperApp
//
//  Created by Luigi Marrandino on 12/03/18.
//  Copyright © 2018 Luigi Marrandino. All rights reserved.
//

import UIKit

let DB = UserDefaults()

extension UserDefaults {
    func saveProduct(product: Product) {
        var products = array(forKey: "recentProducts") ?? [Product]()
        products.append(product)
        set(products, forKey: "recentProducts")
    }
    
    func recentProducts() -> [Product] {
        return array(forKey: "recentProducts") as! [Product]
    }
 }
