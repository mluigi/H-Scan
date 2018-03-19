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

let hkStore = HKHealthStore()


class ProfileViewController: UIViewController, SideMenuItemContent {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func openMenu(_ sender: Any) {
        showSideMenu()
    }
    
}
