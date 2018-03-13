//
//  Persona.swift
//  barcodeSuperApp
//
//  Created by Luigi Marrandino on 12/03/18.
//  Copyright © 2018 Luigi Marrandino. All rights reserved.
//

import Foundation
import RealmSwift
import Realm
class Persona : Object {
    @objc dynamic var nome = ""
    @objc dynamic var cognome = ""
    
    convenience init(nome : String, cognome : String) {
        self.init()
        self.nome = nome
        self.cognome = cognome
    }
}
