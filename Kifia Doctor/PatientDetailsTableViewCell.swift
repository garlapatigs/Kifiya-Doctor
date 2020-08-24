//
//  PatientDetailsTableViewCell.swift
//  Kifia Doctor
//
//  Created by apple on 10/08/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class PatientDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var mobNumLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var imageBackView: UIView!
    @IBOutlet weak var medicineLbl1: UILabel!
    @IBOutlet weak var medicineLbl2: UILabel!
    @IBOutlet weak var medicineLbl3: UILabel!
    @IBOutlet weak var qtyLbl1: UILabel!
    @IBOutlet weak var qtyLbl2: UILabel!
    @IBOutlet weak var qtyLbl3: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        imageBackView.roundBorder(view: imageBackView)
        profileImg.roundedImg(imageView: profileImg)
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
