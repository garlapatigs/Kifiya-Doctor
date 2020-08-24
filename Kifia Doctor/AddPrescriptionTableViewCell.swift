//
//  AddPrescriptionTableViewCell.swift
//  Kifia Doctor
//
//  Created by apple on 10/08/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class AddPrescriptionTableViewCell: UITableViewCell {

    @IBOutlet weak var serialNoLbl: UILabel!
    @IBOutlet weak var mobNoTF: UITextField!
    @IBOutlet weak var qtyTF: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        serialNoLbl.border(label: serialNoLbl)
        mobNoTF.border(textField: mobNoTF)
        qtyTF.border(textField: qtyTF)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
