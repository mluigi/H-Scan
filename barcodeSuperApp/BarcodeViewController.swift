//
//  ViewController.swift
//  barcodeSuperApp
//
//  Created by Luigi Marrandino on 12/03/18.
//  Copyright © 2018 Luigi Marrandino. All rights reserved.
//

import UIKit
import BarcodeScanner
import InteractiveSideMenu

class BarcodeViewController: BarcodeScannerViewController, SideMenuItemContent {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageViewController.textLabel.text = "Inquadra il codice a barre"
        codeDelegate = self
        errorDelegate = self
        dismissalDelegate = self
    }
    
    @IBAction func openMenu(_ sender: Any) {
        showSideMenu()
    }
}

extension BarcodeViewController: BarcodeScannerCodeDelegate {
    func scanner(_ controller: BarcodeScannerViewController, didCaptureCode code: String, type: String) {
        print(code)
        resetWithError()
    }
}

extension BarcodeViewController: BarcodeScannerErrorDelegate {
    func scanner(_ controller: BarcodeScannerViewController, didReceiveError error: Error) {
        controller.dismiss(animated: true, completion: nil)
    }
}

extension BarcodeViewController: BarcodeScannerDismissalDelegate {
    func scannerDidDismiss(_ controller: BarcodeScannerViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}

