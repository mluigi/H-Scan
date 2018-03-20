//
//  HostViewController.swift
//  barcodeSuperApp
//
//  Created by Luigi Marrandino on 15/03/18.
//  Copyright © 2018 Luigi Marrandino. All rights reserved.
//

import UIKit
import InteractiveSideMenu

class HostViewController: MenuContainerViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let screenSize: CGRect = UIScreen.main.bounds
        self.transitionOptions = TransitionOptions(duration: 0.4, visibleContentWidth: screenSize.width / 6)
        self.transitionOptions.contentScale = 1.0

        self.menuViewController = self.storyboard?.instantiateViewController(withIdentifier: "BarcodeMenuViewController") as! BarcodeMenuViewController

        self.contentViewControllers = contentControllers()

        self.selectContentViewController(contentViewControllers.first!)
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)

        // Options to customize menu transition animation.
        var options = TransitionOptions()

        // Animation duration
        options.duration = size.width < size.height ? 0.4 : 0.6

        // Part of item content remaining visible on right when menu is shown
        options.visibleContentWidth = size.width / 6

        options.contentScale = 1.0
        self.transitionOptions = options
    }

    private func contentControllers() -> [UIViewController] {
        return [
            (self.storyboard?.instantiateViewController(withIdentifier: "NavigationBarcodeViewController"))!,
            (self.storyboard?.instantiateViewController(withIdentifier: "NavigationRecentViewController"))!,
            (self.storyboard?.instantiateViewController(withIdentifier: "ProfileViewController"))!
        ]
    }
}
