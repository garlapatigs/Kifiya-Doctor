//
//  SpalshViewController.swift
//  Kifia Doctor
//
//  Created by apple on 06/08/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class SpalshViewController: UIViewController {

    @IBOutlet weak var imageView: UIView!
    @IBOutlet weak var doctor_and_appoinmentsLbl: UILabel!
    @IBOutlet weak var pageControl_View1: UIView!
    @IBOutlet weak var pageControl_View2: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now()+2) { [weak self] in
            self!.doctor_and_appoinmentsLbl.text = "Doctors"
            self!.pageControl_View2.backgroundColor = .darkGray
        }
    
     DispatchQueue.main.asyncAfter(deadline: .now()+2) { [weak self] in
        
            self!.doctor_and_appoinmentsLbl.text = "Appointments"
            self!.pageControl_View1.backgroundColor = .darkGray
            self!.pageControl_View2.backgroundColor = .systemOrange
        }
       DispatchQueue.main.asyncAfter(deadline: .now()+2) { [weak self] in
        guard let vc = self?.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as? LoginVC else{return}
                           vc.modalPresentationStyle = .fullScreen
        self?.navigationController?.pushViewController(vc, animated: true)
            
        }
        
    }

}
