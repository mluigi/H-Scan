//
//  BarcodeMenuCell.swift
//  barcodeSuperApp
//
//  Created by Luigi Marrandino on 15/03/18.
//  Copyright © 2018 Luigi Marrandino. All rights reserved.
//

import UIKit

class BarcodeMenuCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var selectedView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        selectedView.backgroundColor = selected ? UIColor.yellow : UIColor.clear
        label.textColor = selected ? UIColor.yellow : UIColor.white
    }

}
