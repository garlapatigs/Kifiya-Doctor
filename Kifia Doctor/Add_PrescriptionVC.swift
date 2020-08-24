//
//  Add_PrescriptionVC.swift
//  Kifia Doctor
//
//  Created by apple on 07/08/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class Add_PrescriptionVC: UIViewController {
    
    
    @IBOutlet weak var countryCodeView: UIView!
    
    @IBOutlet weak var mobileNo: UITextField!
    
    @IBOutlet weak var confirmBtn: UIButton!
    
    @IBOutlet weak var patientDetailsView: UIView!
    
    
    @IBOutlet weak var addPrescriptionView: UIView!
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        patientDetailsView.isHidden = true
        addPrescriptionView.isHidden = true
        
        tableView.delegate = self
        tableView.dataSource = self
        confirmBtn.corner(button: confirmBtn)
        countryCodeView.border(view: countryCodeView)
        patientDetailsView.border(view: patientDetailsView)
        addPrescriptionView.border(view: addPrescriptionView)
        mobileNo.border(textField: mobileNo)

        // Do any additional setup after loading the view.
    }
    
    @IBAction func confirmBtnAction(_ sender: UIButton) {
        patientDetailsView.isHidden = false
        addPrescriptionView.isHidden = false
    }
    @IBAction func backBtnAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)

    }
    
}

extension Add_PrescriptionVC:UITableViewDelegate, UITableViewDataSource {

 func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
{
    return 50 //
}
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 2
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "AddPrescriptionTableViewCell", for: indexPath)as! AddPrescriptionTableViewCell
    
    return cell
}
}
