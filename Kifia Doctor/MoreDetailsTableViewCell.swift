//
//  MoreDetailsTableViewCell.swift
//  Kifia Doctor
//
//  Created by apple on 10/08/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class MoreDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var prescriptionLbl: UILabel!
    @IBOutlet weak var qtyLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
