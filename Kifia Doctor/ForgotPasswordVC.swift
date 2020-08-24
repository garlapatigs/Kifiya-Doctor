//
//  ForgotPasswordVC.swift
//  Kifia Doctor
//
//  Created by apple on 06/08/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class ForgotPasswordVC: UIViewController {

    var forgotPassword: ForgotPasswordModel?
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var sendEmailBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        emailTF.withImage(direction: .Right, image: UIImage(named: "profile placeholder")!, colorSeparator: .white, colorBorder: .white)
        sendEmailBtn.corner(button: sendEmailBtn)
        emailTF.border(textField: emailTF)
        // Do any additional setup after loading the view.
    }
    

    @IBAction func backBtnAction(_ sender: Any) {
        
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func sendEmailBtnAction(_ sender: Any) {
        
       guard let email = emailTF.text, email.count != 0 else {
           Alert.TextField(on: self, text: "E-mail", type: .Empty)
           return
       }
        var param: [String:Any] = ["email": email]
        forgotPassword(paramters: param)
    }
    
    
    //MARK:- Forgot password
     
         func forgotPassword(paramters:[String:Any]){
             WebService.shared.postMethod(Api: .forgot_password, parameter: paramters) { (response) -> (Void) in
                         do{
                             let json = try JSONDecoder().decode(ForgotPasswordModel.self, from: response)
                             print(json)
                                                 
     //                        if let msg = json.message{
     //                            if msg == "OTP (One Time Password) sent to registered e-mail" {
     //                                print("msg: ",msg)
     //                            } else { return}
     //                        }
                             
                             if json.otp != nil{
                                 self.forgotPassword = json
                                 //Defaults.setLoginData(response)
                                 DispatchQueue.main.async {
                                     
                                     let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                                     let vc = storyBoard.instantiateViewController(withIdentifier: "ResetPasswordVC") as! ResetPasswordVC
                                     //vc.details(name: json.data.doctor.firstName, mobNo: json.data.doctor.mobile, email: json.data.doctor.email)
                                     vc.forgotPassWord = self.forgotPassword
                                     vc.modalPresentationStyle = .fullScreen
                                     self.navigationController?.pushViewController(vc, animated: true)
                                 }
                             }
                         }
             
                         catch let err{
                            print(err.localizedDescription)
                            Toast.makeToast(message: "Enter Valid Email ", in: self.view)
                         }
                     }
             
         }
     
    
}
