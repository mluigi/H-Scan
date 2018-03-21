//
//  ProfileViewController.swift
//  barcodeSuperApp
//
//  Created by Luigi Marrandino on 16/03/18.
//  Copyright © 2018 Luigi Marrandino. All rights reserved.
//

import UIKit
import InteractiveSideMenu
import HealthKit
import HealthKitUI

//let hkStore = HKHealthStore()
let hkStore: HKHealthStore = HKHealthStore()

let healthKitTypesToRead: Set<HKObjectType> = [
    HKSampleType.quantityType(forIdentifier: .height)!,
    HKSampleType.quantityType(forIdentifier: .bodyMass)!,
    HKSampleType.quantityType(forIdentifier: .bodyMassIndex)!,
    HKObjectType.characteristicType(forIdentifier: .biologicalSex)!,
    HKObjectType.characteristicType(forIdentifier: .dateOfBirth)!
]

let healthKitTypesToWrite: Set<HKSampleType> = [
    HKSampleType.quantityType(forIdentifier: HKQuantityTypeIdentifier.height)!,
    HKSampleType.quantityType(forIdentifier: HKQuantityTypeIdentifier.bodyMass)!,
    HKSampleType.quantityType(forIdentifier: HKQuantityTypeIdentifier.bodyMassIndex)!
]

var permissionsAcquired = false

class ProfileViewController: UIViewController, SideMenuItemContent {
    @IBOutlet weak var lHeight: UILabel!
    @IBOutlet weak var lWeight: UILabel!
    @IBOutlet weak var lSex: UILabel!
    @IBOutlet weak var lAge: UILabel!
    var weight = 0.0
    var height = 0.0
    var age = 0
    var sex = 0
    
    @IBOutlet weak var circleGraphUnico: CircleGraphView!
    @IBOutlet weak var dailyCAlories: UILabel!
    @IBOutlet weak var calories: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.global(qos: .background).async {
            while !permissionsAcquired {
            }
            self.updateHeight()
            self.updateWeight()
            self.updateSex()
            self.lAge.text = String(getAge())
        }
        
       circleGraphUnico.arcWidth = 25
        
        let backgroundTrackColor = UIColor(white: 0.15, alpha: 0.1)
        circleGraphUnico.arcBackgroundColor = backgroundTrackColor
        // circleGraphEsterno.arcColor = .#FFFF
        circleGraphUnico.endArc = CGFloat(calorieConsumate / calcoloCalorieGiornaliere())
        dailyCAlories.text = String ( calcoloCalorieGiornaliere())
        
        calories.text  = String (format: "%.0f" , calorieConsumate) + " / " + String ( format : "%.0f", calcoloCalorieGiornaliere()) + " kCal"
        
    }
    override func viewWillAppear(_ animated: Bool) {
        circleGraphUnico.arcWidth = 25
        
        let backgroundTrackColor = UIColor(white: 0.15, alpha: 0.1)
        circleGraphUnico.arcBackgroundColor = backgroundTrackColor
        // circleGraphEsterno.arcColor = .#FFFF
        circleGraphUnico.endArc = CGFloat(calorieConsumate / calcoloCalorieGiornaliere())
        dailyCAlories.text = String ( calcoloCalorieGiornaliere())
        
        calories.text  = String (format: "%.0f" , calorieConsumate) + " / " + String ( format : "%.0f", calcoloCalorieGiornaliere()) + " kCal"
        
    }

    func updateHeight() {
        let heightSample = HKSampleType.quantityType(forIdentifier: .height)
        getMostRecentSample(for: heightSample!, completion: { (sample, error) in
            guard let sample = sample else {
                if error != nil {
                    print("error")
                }
                return
            }
            self.height = sample.quantity.doubleValue(for: HKUnit.meter())
            self.lHeight.text = String(self.height)
        })
    }

    func updateWeight() {
        DispatchQueue.main.async {
            self.lWeight.text = String(peso)
        }
    }

    func updateSex() {
        switch getSex() {
        case 1:
            self.lSex.text = "Female"
        case 2:
            self.lSex.text = "Male"
        default:
            self.lSex.text = "BOOOOOH"
        }
    }

    @IBAction func openMenu(_ sender: Any) {
        showSideMenu()
    }

}

func requestPermissions() {
    
    if HKHealthStore.isHealthDataAvailable() {
        // add code to use HealthKit here...
        print("Yes, HealthKit is Available")
    } else {
        print("There is a problem accessing HealthKit")
    }
    
    hkStore.requestAuthorization(toShare: healthKitTypesToWrite, read: healthKitTypesToRead) { (success, error) -> Void in
        if success {
            print("success")
            permissionsAcquired = true
        } else {
            print("failed")
        }
    }
}

func getMostRecentSample(for sampleType: HKSampleType,
                         completion: @escaping (HKQuantitySample?, Error?) -> Swift.Void) {
    
    //1. Use HKQuery to load the most recent samples.
    let mostRecentPredicate = HKQuery.predicateForSamples(withStart: Date.distantPast,
                                                          end: Date(),
                                                          options: .strictEndDate)
    
    let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate,
                                          ascending: false)
    
    let limit = 1
    
    let sampleQuery = HKSampleQuery(sampleType: sampleType,
                                    predicate: mostRecentPredicate,
                                    limit: limit,
                                    sortDescriptors: [sortDescriptor]) { (query, samples, error) in
                                        
                                        //2. Always dispatch to the main thread when complete.
                                        DispatchQueue.main.async {
                                            
                                            guard let samples = samples,
                                                let mostRecentSample = samples.first as? HKQuantitySample else {
                                                    
                                                    completion(nil, error)
                                                    return
                                            }
                                            
                                            completion(mostRecentSample, nil)
                                        }
    }
    
    hkStore.execute(sampleQuery)
}

func getAge() -> Int {
    let date = try! hkStore.dateOfBirthComponents()
    let today = Calendar.current.dateComponents([.year, .month, .day], from: Date())
    var age = today.year! - date.year!
    if today.month! < date.month! || (today.month! == date.month! && today.day! < date.day!) {
        age -= 1
    }
    
    return age
}

func getWeight() {
    let weightSample = HKSampleType.quantityType(forIdentifier: .bodyMass)
    getMostRecentSample(for: weightSample!, completion: { (sample, error) in
        guard let sample = sample else {
            if let error = error {
                print("error")
            }
            return
        }
        peso = sample.quantity.doubleValue(for: HKUnit.gramUnit(with: .kilo))
    })
}

func getSex() -> Int {
    return try! hkStore.biologicalSex().biologicalSex.rawValue
}
