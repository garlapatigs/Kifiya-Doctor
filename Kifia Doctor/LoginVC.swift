//
//  LoginVC.swift
//  Kifia Doctor
//
//  Created by apple on 06/08/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    var login:Login?
   
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationItem.hidesBackButton = true
        emailTF.withImage(direction: .Right, image: UIImage(named: "profile placeholder")!, colorSeparator: .white, colorBorder: .white)
        passwordTF.withImage(direction: .Right, image: UIImage(named: "eye")!, colorSeparator: .white, colorBorder: .white)
        emailTF.border(textField: emailTF)
        passwordTF.border(textField: passwordTF)
        loginBtn.corner(button: loginBtn)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginBtnAction(_ sender: UIButton) {
        
        guard let mob = emailTF.text, mob.count != 0 else{
                   Alert.TextField(on: self, text: "UserName", type: .Empty)
                   return
               }
       
        guard let password = passwordTF.text, password.count != 0 else {
            Alert.TextField(on: self, text: "Password", type: .Empty)
            return
        }
    
       var params:[String:Any] = [
           
            "password": "nandu123",
            "mobile": "9789529522",
           "device_id":"2",
           "device_token":"3dfasdfasd44",
           "device_type":"ios"
       ]
        login(paramters: params)
    }
    
    @IBAction func forgotBtnAction(_ sender: UIButton) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "ForgotPasswordVC") as? ForgotPasswordVC else{return}
                           vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

    @IBAction func signUpBtnAction(_ sender: UIButton) {
        
       guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignUpVC") as? SignUpVC else{return}
                           vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func login(paramters:[String:Any]){
                WebService.shared.postMethod(Api: .login, parameter: paramters) { (response) -> (Void) in
                    do{
                        let json = try JSONDecoder().decode(Login.self, from: response)
                        print(json)
                                            
//                        if let msg = json.message{
//                            if msg == "OTP (One Time Password) sent to registered e-mail" {
//                                print("msg: ",msg)
//                            } else { return}
//                        }
                        
                        if json.data.accessToken != nil{
                            
                            //Defaults.setLoginData(response)
                            
                            DispatchQueue.main.async {
                                self.login = json
                                Defaults.setAccessToken(json.data.accessToken ?? "")
                                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                                let vc = storyBoard.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
                                //vc.details(name: json.data.doctor.firstName, mobNo: json.data.doctor.mobile, email: json.data.doctor.email)
                                vc.login = self.login
                                vc.modalPresentationStyle = .fullScreen
                                self.navigationController?.pushViewController(vc, animated: true)
                            }
                        }
                    }
        
                    catch let err{
                        Toast.makeToast(message: "Invalid UserName or Password", in: self.view)
                    }
                }
        
    }
    
    
 
}
