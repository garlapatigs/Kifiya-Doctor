//
//  ReviewsTableViewCell.swift
//  Kifia Doctor
//
//  Created by apple on 10/08/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class ReviewsTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var imageBackView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageBackView.roundBorder(view: imageBackView)
        profileImg.roundedImg(imageView: profileImg)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
