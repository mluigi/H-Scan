//
//  BarcodeMenuViewController.swift
//  barcodeSuperApp
//
//  Created by Luigi Marrandino on 15/03/18.
//  Copyright © 2018 Luigi Marrandino. All rights reserved.
//

import UIKit
import InteractiveSideMenu

class BarcodeMenuViewController: MenuViewController {

    @IBOutlet fileprivate weak var tableView: UITableView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageViewXCenter: NSLayoutConstraint!

    private var gradientLayer = CAGradientLayer()

    private var gradientApplied: Bool = false

    override var prefersStatusBarHidden: Bool {
        return false
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.selectRow(at: IndexPath(row: 0, section: 0), animated: false, scrollPosition: UITableViewScrollPosition.none)

        imageView.layer.cornerRadius = imageView.frame.size.width / 2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageViewXCenter.constant = -(menuContainerViewController?.transitionOptions.visibleContentWidth ?? 0.0) / 2

        let topColor = UIColor(red: 16.0 / 255.0, green: 12.0 / 255.0, blue: 54.0 / 255.0, alpha: 1.0)
        let bottomColor = UIColor(red: 57.0 / 255.0, green: 33.0 / 255.0, blue: 61.0 / 255.0, alpha: 1.0)
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        gradientLayer.frame = view.bounds
        view.layer.insertSublayer(gradientLayer, at: 0)
    }

}

extension BarcodeMenuViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuContainerViewController?.contentViewControllers.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: BarcodeMenuCell.self), for: indexPath) as? BarcodeMenuCell else {
            preconditionFailure("Unregistered table view cell")
        }

        cell.label.text = menuContainerViewController?.contentViewControllers[indexPath.row].title ?? "A Controller"

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let menuContainerViewController = self.menuContainerViewController else {
            return
        }
        menuContainerViewController.selectContentViewController(menuContainerViewController.contentViewControllers[indexPath.row])
        menuContainerViewController.hideSideMenu()
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let v = UIView()
        v.backgroundColor = UIColor.clear
        return v
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.5
    }
}
