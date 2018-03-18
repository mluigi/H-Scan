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

extension UserDefaults {
    func saveProduct(product: Product) {
        var products = (array(forKey: recentProds) as? [Product]) ?? [Product]()
        if products.contains(where: {
            $0.name == product.name
        }) {
            products.filter{$0.name == product.name}.first!.count += 1
        } else {
            products.append(product)
        }
        set(products, forKey: recentProds)
    }
    
    func recentProducts() -> [Product] {
        return array(forKey: recentProds) as! [Product]
    }
 }
