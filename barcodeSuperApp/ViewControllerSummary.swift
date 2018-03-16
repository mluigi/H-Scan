//
//  ViewControllerSummary.swift
//  barcodeSuperApp
//
//  Created by Davide Compagnone on 15/03/18.
//  Copyright © 2018 Luigi Marrandino. All rights reserved.
//

import UIKit
import HealthKit

class ViewControllerSummary: UIViewController {

    @IBOutlet var subView2: UIView!
    
    @IBOutlet var circleGraphEsterno: CircleGraphView!
    
    @IBOutlet var circleGraphInterno: CircleGraphView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        //Inizializzazione dei cerchi
        
        
        let backgroundTrackColor = UIColor(white: 0.15, alpha: 0.1)
        circleGraph.arcBackgroundColor = backgroundTrackColor
        circleGraph.endArc = CGFloat(0.8)
        
        let backgroundTrackColorInterno = UIColor(white: 0.15, alpha: 0.05)
        circleGraphInterno.arcBackgroundColor  = backgroundTrackColorInterno
        circleGraphInterno.arcColor = .red
        circleGraphInterno.endArc = CGFloat(0.6)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    
    
}
