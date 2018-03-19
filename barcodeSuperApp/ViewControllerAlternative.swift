//
//  ViewControllerAlternative.swift
//  cerchi
//
//  Created by Davide Compagnone on 19/03/18.
//  Copyright © 2018 Davide Compagnone. All rights reserved.
//

import UIKit

class ViewControllerAlternative: UIViewController {

    @IBOutlet var imageProdotto: UIImageView!
    @IBOutlet var nomeProdotto: UILabel!
    @IBOutlet var labelQuantita: UILabel!
    @IBOutlet var labelCalorie: UILabel!
    @IBOutlet var descrizione: UITextView!
    @IBOutlet var buttonEat: UIButton!
    @IBOutlet var buttonAlternative: UIButton!
    @IBOutlet var circleGraphEsterno: CircleGraphView!
    @IBOutlet var circleGraphInterno: CircleGraphView!
    
    var calorieConsumate : Double = 1200
    var caloriePersona = calcoloCalorieGiornaliere()
    
    
    
    
    var previousRandomNumber = -1

   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let randomnumber = Int(arc4random_uniform(UInt32(alternatives.count)))
        let randomAlternative = alternatives[randomnumber]
        
//        //riga di prova
//        let randomnumber = Int(arc4random_uniform(10))
//        let randomAlternative = Product(name: "Apple", image: #imageLiteral(resourceName: "kinderBueno"), calories: 60, pieces: 1, nutritionalProprieties: "Helps in cancer prevention, regulates diabetes levels, lower cholesterol")
        
        
        if previousRandomNumber == randomnumber {
            self.viewDidLoad()

        }
        else {
            
            
            imageProdotto.image = randomAlternative.image
            nomeProdotto.text = randomAlternative.name
            descrizione.text = randomAlternative.nutritionalProprieties
            labelQuantita.text = "1"
            labelCalorie.text = String(randomAlternative.calories)
            
            //impostazione dei cerchi
            
            circleGraphEsterno.arcWidth = 20
            circleGraphInterno.arcWidth = 20
            
            let backgroundTrackColor = UIColor(white: 0.15, alpha: 0.1)
            circleGraphEsterno.arcBackgroundColor = backgroundTrackColor
            // circleGraphEsterno.arcColor = .#FFFF
            circleGraphEsterno.endArc = CGFloat(calorieConsumate/caloriePersona)
            previousRandomNumber = randomnumber
            
            let backgroundTrackColorInterno = UIColor(white: 0.15, alpha: 0.05)
            circleGraphInterno.arcBackgroundColor  = backgroundTrackColorInterno
            circleGraphInterno.arcColor = .red
            circleGraphInterno.endArc = CGFloat((calorieConsumate + Double(randomAlternative.calories)) / caloriePersona)
            
        }
        
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    @IBAction func alternativa(_ sender: Any) {
        self.viewDidLoad()
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
