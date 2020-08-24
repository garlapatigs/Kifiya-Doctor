//
//  EditProfileVC.swift
//  Kifia Doctor
//
//  Created by apple on 07/08/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class EditProfileVC: UIViewController {

    @IBOutlet weak var confirmBtn: UIButton!
    @IBOutlet weak var selectPhotoBtn: UIButton!
    @IBOutlet weak var profileImg: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImg.roundedImg(imageView: profileImg)
        confirmBtn.corner(button: confirmBtn)

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func selectPhotoBtnAction(_ sender: UIButton) {
    }
    
    @IBAction func confirmBtnAction(_ sender: UIButton) {
    }
    @IBAction func backBtnAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
