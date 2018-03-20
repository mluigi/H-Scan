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
let dailyCalories = "dailyCalories"
let day = "day"
let dateFormat = "dd-MM-yyyy"

extension UserDefaults {
    func saveProduct(_ barcode: String) {
        var products = recentProducts() ?? [String]()
        if !products.contains(barcode) {
            products.append(barcode)
        }
        set(products, forKey: recentProds)
        //synchronize()
    }

    func recentProducts() -> [String]? {
        return array(forKey: recentProds) as! [String]?
    }

    func saveCalories(calories: Float) {
        set(calories, forKey: dailyCalories)
    }

    func getCalories() -> Float {
        return float(forKey: dailyCalories)
    }

    func saveDate(date: Date) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        set(dateFormatter.string(from: date), forKey: day)
    }

    func getDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        guard let date = string(forKey: day) else {
            return nil
        }
        return dateFormatter.date(from: date)
    }

}
