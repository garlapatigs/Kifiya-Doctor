//
//  HomeVC.swift
//  Kifia Doctor
//
//  Created by apple on 06/08/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    var login: Login?
    var prescriptionModalData:PrescriptionModelDataClass?
    @IBOutlet var alertView: UIView!
    @IBOutlet weak var imageBackgroundView: UIView!
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var mobLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    
//    private var email: String?
//    private var name: String?
//    private var mob: String?
    override func viewDidLoad() {
        
        super.viewDidLoad()
//        let loginData = Defaults.getLoginData()
//        print(loginData)
        alertView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        view.addSubview(alertView)
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        imageBackgroundView.roundBorder(view: imageBackgroundView)
        profileImg.roundedImg(imageView: profileImg)
        tableView.delegate = self
        tableView.dataSource = self
        collectionView.delegate = self
        collectionView.dataSource = self
        //displayUserDetails()
        self.details(name: login?.data.doctor.firstName ?? "", mobNo: login?.data.doctor.mobile ?? "", email: login?.data.doctor.email ?? "")
       
//        navigationController?.navigationBar.barTintColor = .white
//               navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//               navigationController?.navigationBar.shadowImage = UIImage()
        // Do any additional setup after loading the view.
        
        
        var params:[String:Any] = [
            "doctor_id": 2]
        Prescription(paramters: params)
    }
    
     func details(name:String, mobNo:String, email:String){
//        self.email = email
//        self.mob = mobNo
//        self.name = name
        
       emailLbl.text = email
        mobLbl.text = mobNo
        nameLbl.text = name
    }
//    func displayUserDetails(){
//
//        emailLbl.text = seemail
//        mobLbl.text = mob
//        nameLbl.text = name
//
//
//    }
   
    
       func Prescription(paramters:[String:Any]){
        WebService.shared.postMethod(Api: .get_prescription_by_doctor, parameter: paramters) { (response) -> (Void) in
                        do{
                            
                            let json = try JSONDecoder().decode(PrescriptionModel.self, from: response)
                            print(json)
                            DispatchQueue.main.async {
                                self.prescriptionModalData = json.data
                                self.tableView.reloadData()
                            }
                        }
            
                        catch let err{
                            
                            print(err.localizedDescription)
                        }
                    }
            
        }
    
    
}

extension HomeVC {
    @IBAction func alertNoAction(_ sender: UIButton) {
        alertView.removeFromSuperview()
    }
    @IBAction func alertYesAction(_ sender: UIButton) {
        
        
       }
}


extension HomeVC:UITableViewDelegate, UITableViewDataSource {
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 148
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.prescriptionModalData?.prescription.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PatientDetailsTableViewCell", for: indexPath) as? PatientDetailsTableViewCell
       // cell.imageView?.image = UIImage(named: "profile placeholder")
        let userDetails = self.prescriptionModalData?.prescription[indexPath.row].user
        let prescriptionDetails = self.prescriptionModalData?.prescription[indexPath.row].prescriptionDetails
        cell?.nameLbl.text = userDetails?.firstName
        cell?.mobNumLbl.text = userDetails?.mobile
        if prescriptionDetails?.count ?? 0 >= 3{
            cell?.medicineLbl1.text = prescriptionDetails?[0].medicineName ?? ""
            cell?.qtyLbl1.text = "\(prescriptionDetails?[0].quantity ?? 0)"
            cell?.medicineLbl2.text = prescriptionDetails?[1].medicineName ?? ""
            cell?.qtyLbl2.text = "\(prescriptionDetails?[1].quantity ?? 0)"
            cell?.medicineLbl3.text = prescriptionDetails?[2].medicineName ?? ""
            cell?.qtyLbl3.text = "\(prescriptionDetails?[2].quantity ?? 0)"
        }
        else if prescriptionDetails?.count ?? 0 == 2{
            cell?.medicineLbl1.text = prescriptionDetails?[0].medicineName ?? ""
            cell?.qtyLbl1.text = "\(prescriptionDetails?[0].quantity ?? 0)"
            cell?.medicineLbl2.text = prescriptionDetails?[1].medicineName ?? ""
            cell?.qtyLbl2.text = "\(prescriptionDetails?[1].quantity ?? 0)"
            cell?.medicineLbl3.text = ""
            cell?.qtyLbl3.text = ""
        }
        else if prescriptionDetails?.count ?? 0 == 1{
            cell?.medicineLbl1.text = prescriptionDetails?[0].medicineName ?? ""
            cell?.qtyLbl1.text = "\(prescriptionDetails?[0].quantity ?? 0)"
            cell?.medicineLbl2.text = ""
            cell?.qtyLbl2.text = ""
            cell?.medicineLbl3.text = ""
            cell?.qtyLbl3.text = ""
        }
        else {
            cell?.medicineLbl1.text = "No Prescription found"
            cell?.qtyLbl1.text = ""
            cell?.medicineLbl2.text = ""
            cell?.qtyLbl2.text = ""
            cell?.medicineLbl3.text = ""
            cell?.qtyLbl3.text = ""
        }
        return cell!
    }
}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BtnCollectionViewCell", for: indexPath)as! BtnCollectionViewCell
        if indexPath.item == 0{
            
        }
        else if indexPath.item == 1{
            cell.titleLbl.text = "Edit Profile"
        }
        else {
            cell.titleLbl.text = "Reviews"
        }
        cell.iconImgView.image = UIImage(named: "review")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item == 0 {
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyBoard.instantiateViewController(withIdentifier: "Add_PrescriptionVC") as! Add_PrescriptionVC
            //vc.details(name: json.data.doctor.firstName, mobNo: json.data.doctor.mobile, email: json.data.doctor.email)
            //vc.login = self.login
            vc.modalPresentationStyle = .fullScreen
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else if indexPath.item == 1{
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyBoard.instantiateViewController(withIdentifier: "EditProfileVC") as! EditProfileVC
            //vc.details(name: json.data.doctor.firstName, mobNo: json.data.doctor.mobile, email: json.data.doctor.email)
            //vc.login = self.login
            vc.modalPresentationStyle = .fullScreen
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else {
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyBoard.instantiateViewController(withIdentifier: "ReviewsVC") as! ReviewsVC
            //vc.details(name: json.data.doctor.firstName, mobNo: json.data.doctor.mobile, email: json.data.doctor.email)
            //vc.login = self.login
            vc.modalPresentationStyle = .fullScreen
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
