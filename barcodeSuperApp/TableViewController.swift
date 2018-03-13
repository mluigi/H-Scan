//
//  TableViewController.swift
//  barcodeSuperApp
//
//  Created by Luigi Marrandino on 12/03/18.
//  Copyright © 2018 Luigi Marrandino. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DB.objects(Persona.self).count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let people = DB.objects(Persona.self)
        cell.textLabel!.text = people[indexPath.row].nome
        cell.detailTextLabel!.text = people[indexPath.row].cognome
        return cell
    }
}
