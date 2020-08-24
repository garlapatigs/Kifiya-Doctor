//
//  HistoryTableViewCell.swift
//  Kifia Doctor
//
//  Created by apple on 10/08/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {

    @IBOutlet weak var imageBackgroundView: UIView!
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var moreDetailsBtn: UIButton!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var qtyLbl: UILabel!
    @IBOutlet weak var mobNoLbl: UILabel!
    @IBOutlet weak var prescriptionNameLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        imageBackgroundView.roundBorder(view: imageBackgroundView)
        profileImg.roundedImg(imageView: profileImg)
        // Initialization code
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
