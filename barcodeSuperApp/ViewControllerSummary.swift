//
//  ViewControllerSummary.swift
//  cerchi
//
//  Created by Davide Compagnone on 16/03/18.
//  Copyright © 2018 Davide Compagnone. All rights reserved.
//

import UIKit

class ViewControllerSummary: UIViewController {

    //variabili
    var caloriePersona = calcoloCalorieGiornaliere()
    var numSelezionati = 2

    @IBOutlet var labelNome: UILabel!
    @IBOutlet var labelKcal: UILabel!
    @IBOutlet var labelQuantita: UILabel!
    @IBOutlet var image: UIImageView!
    
    var numSelezionato : Double = 1

    @IBOutlet var circleGraphEsterno: CircleGraphView!
    @IBOutlet var circleGraphInterno: CircleGraphView!

    @IBOutlet var buttonEat: UIButton!

    @IBOutlet var slaier: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //impostazione delle label
        print(temp.name)
        labelNome.text = temp!.name
        labelKcal.text = String(temp!.calories)
        labelQuantita.text = String(1)
        image.image = temp!.image

        //impostazione dello slider

        slaier.setValue(Float(1), animated: false)
        slaier.maximumValue = Float(temp!.pieces)

        //impostazione dei cerchi

        circleGraphEsterno.arcWidth = 25
        circleGraphInterno.arcWidth = 25

        let backgroundTrackColor = UIColor(white: 0.15, alpha: 0.1)
        circleGraphEsterno.arcBackgroundColor = backgroundTrackColor
        // circleGraphEsterno.arcColor = .#FFFF
        circleGraphEsterno.endArc = CGFloat(calorieConsumate / caloriePersona)

        let backgroundTrackColorInterno = UIColor(white: 0.15, alpha: 0.05)
        circleGraphInterno.arcBackgroundColor = backgroundTrackColorInterno
        circleGraphInterno.arcColor = .red
        circleGraphInterno.endArc = CGFloat((calorieConsumate + Double(temp!.calories)) / caloriePersona)

        // Do any additional setup after loading the view.
    }

    @IBAction func eatProduct(_ sender: Any) {
        calorieConsumate += Double (temp.calories) * numSelezionato
        DB.saveCalories(calories: Float(calorieConsumate))
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func seleziona(_ sender: UISlider) {

        let quantita = sender.value

        labelQuantita.text = String(format: "%.1f", quantita)
        labelKcal.text = String(format: "%.1f", sender.value * temp!.calories)
        circleGraphInterno.endArc = CGFloat((calorieConsumate + Double(temp!.calories * sender.value)) / caloriePersona)

        numSelezionato = Double(sender.value)
    }
}
