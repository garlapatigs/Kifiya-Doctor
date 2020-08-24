//
//  BtnCollectionViewCell.swift
//  Kifia Doctor
//
//  Created by apple on 10/08/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class BtnCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var view: UIView!
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var iconImgView: UIImageView!
    
    override func awakeFromNib() {
        view.layer.cornerRadius = 3
        view.layer.masksToBounds = true
        view.clipsToBounds = true
    }
}
