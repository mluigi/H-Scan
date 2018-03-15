//
//  ViewController.swift
//  barcodeSuperApp
//
//  Created by Luigi Marrandino on 12/03/18.
//  Copyright © 2018 Luigi Marrandino. All rights reserved.
//

import RealmSwift
import UIKit
import Realm
import BarcodeScanner

let DB = try! Realm()

class ViewController: BarcodeScannerViewController {
    var lastCode = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        messageViewController.textLabel.text = "Inquadra il codice a barre"
        codeDelegate = self
        errorDelegate = self
        dismissalDelegate = self
    }
}

extension ViewController: BarcodeScannerCodeDelegate {
    func scanner(_ controller: BarcodeScannerViewController, didCaptureCode code: String, type: String) {
        lastCode = code
        print(lastCode)
    }
}

extension ViewController: BarcodeScannerErrorDelegate {
    func scanner(_ controller: BarcodeScannerViewController, didReceiveError error: Error) {
        controller.dismiss(animated: true, completion: nil)
    }
}

extension ViewController: BarcodeScannerDismissalDelegate {
    func scannerDidDismiss(_ controller: BarcodeScannerViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}

