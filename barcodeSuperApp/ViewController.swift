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

class ViewController: UIViewController {
    @IBOutlet weak var lBarcode: UILabel!
    var lastCode = ""

    @IBAction func scan(_ sender: Any) {
        let photoController = makeBarcodeScannerViewController()
        photoController.title = "Scanner"
        present(photoController, animated: true, completion: nil)
    }

    private func makeBarcodeScannerViewController() -> BarcodeScannerViewController {
        let viewController = BarcodeScannerViewController()
        viewController.isOneTimeSearch = true
        viewController.headerViewController.closeButton.isHidden = true
        viewController.codeDelegate = self
        viewController.errorDelegate = self
        viewController.dismissalDelegate = self
        return viewController
    }
}

extension ViewController: BarcodeScannerCodeDelegate {
    func scanner(_ controller: BarcodeScannerViewController, didCaptureCode code: String, type: String) {
        lastCode = code
        print(lastCode)
        lBarcode.text = lastCode
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            controller.dismiss(animated: true, completion: nil)
        }
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

