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
    var lastCode = ""
    
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination
        
    }
}

extension BarcodeViewController: BarcodeScannerCodeDelegate {
    func scanner(_ controller: BarcodeScannerViewController, didCaptureCode code: String, type: String) {
        lastCode = code
        resetWithError()
        messageViewController.textLabel.text = "Inquadra il codice a barre"
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

