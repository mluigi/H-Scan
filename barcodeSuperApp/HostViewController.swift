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
        menuViewController = self.storyboard!.instantiateViewController(withIdentifier: "NavigationMenu") as! MenuViewController
        contentViewControllers = contentControllers() as! [UIViewController]
        selectContentViewController(contentViewControllers.first!)
        // Do any additional setup after loading the view.
    }
    
    private func contentControllers() -> [SideMenuItemContent] {
        var contentList = [SideMenuItemContent]()
        contentList.append(self.storyboard?.instantiateViewController(withIdentifier: "First") as! SideMenuItemContent)
        contentList.append(self.storyboard?.instantiateViewController(withIdentifier: "Second") as! SideMenuItemContent)
        return contentList
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
