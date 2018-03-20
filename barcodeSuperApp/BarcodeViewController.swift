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
        lastCode = code
        if dictionary.contains(where: { $0.key == code }) {
            DB.saveProduct(lastCode)
            temp = dictionary[lastCode]!
            self.navigationController!.pushViewController(self.storyboard!.instantiateViewController(withIdentifier: "ProductViewController"), animated: true)
            resetWithError()
        } else {
            resetWithError(message: "Product not found.")
        }

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

