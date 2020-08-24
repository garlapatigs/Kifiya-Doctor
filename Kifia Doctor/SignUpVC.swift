//
//  SignUpVC.swift
//  Kifia Doctor
//
//  Created by apple on 06/08/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import Alamofire

class SignUpVC: UIViewController {
    
    let url = "http://178.128.38.51/api/doctor/register"
    var signUp: SignUp!
    var registerChecking: RegisterCheck!
    
    @IBOutlet weak var countryView: UIView!
    @IBOutlet weak var fullNameTF: UITextField!
    
    @IBOutlet weak var retypePasswordTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var mobNoTF: UITextField! {
        didSet{
            mobNoTF.keyboardType = .numberPad
        }
    }
    @IBOutlet weak var emailTF: UITextField!{
        didSet{
            emailTF.keyboardType = .emailAddress
        }
    }
    @IBOutlet weak var registerBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        countryView.border(view: countryView)
        fullNameTF.withImage(direction: .Right, image: UIImage(named: "profile placeholder")!, colorSeparator: .white, colorBorder: .white)
        emailTF.withImage(direction: .Right, image: UIImage(named: "mail")!, colorSeparator: .white, colorBorder: .white)
        passwordTF.withImage(direction: .Right, image: UIImage(named: "eye")!, colorSeparator: .white, colorBorder: .white)
        retypePasswordTF.withImage(direction: .Right, image: UIImage(named: "eye")!, colorSeparator: .white, colorBorder: .white)
               fullNameTF.border(textField: fullNameTF)
               retypePasswordTF.border(textField: emailTF)
               passwordTF.border(textField: passwordTF)
               mobNoTF.border(textField: mobNoTF)
               emailTF.border(textField: emailTF)
        registerBtn.corner(button: registerBtn)
        // Do any additional setup after loading the view.
        
    }
    

    @IBAction func registerBtnAction(_ sender: Any) {
        
        guard let firstname = fullNameTF.text, firstname.count != 0 else {
            Alert.TextField(on: self, text: "First Name", type: .Empty)
            return
        }
        
        guard let email = emailTF.text, email.count != 0 else{
            Alert.TextField(on: self, text: "Email", type: .Empty)
            return
        }
        if Constants.isValidEmail(str: email) == false{
            Alert.TextField(on: self, text: "Email", type: .Invalid)
            return
        }
        
        guard let mobile = mobNoTF.text, mobile.count != 0 else {
                   Alert.TextField(on: self, text: "Mobile Number", type: .Mobile)
                   return
               }
        guard let password = passwordTF.text, password.count != 0 else {
                   Alert.TextField(on: self, text: "Password", type: .Empty)
                   return
               }
               guard let confirmpassword = retypePasswordTF.text, confirmpassword.count != 0 else {
                   Alert.TextField(on: self, text: "Confirm Password", type: .Empty)
                   return
               }
               if password.count < 6{
                   Alert.TextField(on: self, text: "Password", type: .LessChar)
                   return
               }
               if confirmpassword.count < 6{
                   Alert.TextField(on: self, text: "Confirm Password", type: .LessChar)
                   return
               }
               guard confirmpassword == password else{
                   Alert.TextField(on: self, text: "Password", type: .MisMatch)
                   return
               }
        var params :[String:Any] = [
            "email": email,
            "mobile": mobile
        ]
                registerCheck(params: params, email: email, mobile: mobile, fullName: firstname, password: password, confirmPassword: confirmpassword)
        
        }
    
    @IBAction func signInBtnAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
            func register(paramters:[String:Any]){
                
                
                        WebService.shared.postMethod(Api: .register, parameter: paramters) { (response) -> (Void) in
                            do{
                                let json = try JSONDecoder().decode(SignUp.self, from: response)
                                print(json)
                                if let msg = json.message{
                                    if msg == "OTP (One Time Password) sent to registered e-mail" {
                                        print("msg: ",msg)
                                    } else { return}
                                }
                                if let err = json.error{
                                    print("err: ", err)
                                }
                                self.signUp = json
                                
                                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                                let vc = storyBoard.instantiateViewController(withIdentifier: "OTPVerifyVC") as! OTPVerifyVC
                                vc.params(otp: "\(json.otp!)", name: self.fullNameTF.text!, pwd: self.passwordTF.text!, confirmPwd: self.retypePasswordTF.text!, email: self.emailTF.text!, mobile: self.mobNoTF.text!)
                                
                                vc.modalPresentationStyle = .fullScreen
                                self.navigationController?.pushViewController(vc, animated: true)
                            }
                
                            catch let err{
                                print(err.localizedDescription)
                            }
                        }
                
            }
            
    
        // Mark:- Registration Checking
        
    func registerCheck(params: [String:Any], email: String, mobile:String, fullName:String, password: String, confirmPassword:String) {
        
        WebService.shared.postMethod(Api: .register_check, parameter: params) { (response) -> (Void) in
            do{
                let json = try JSONDecoder().decode(RegisterCheck.self, from: response)
                print("json", json)
                self.registerChecking = json
                if json.is_email_available && json.is_mobile_available{
                    Toast.makeToast(message: "Already Registered ", in: self.view)
                }
                else if json.is_mobile_available{
                    Toast.makeToast(message: "Mobile Number Already Registered", in: self.view)
                }
                else if json.is_email_available{
                    Toast.makeToast(message: "Email Already Registered ", in: self.view)
                    }
                else{
                    let params:[String:Any] = [
                        "first_name":fullName,
                        "last_name":"G",
                        "password":password,
                        "password_confirmation":confirmPassword,
                        "email":email,
                        "mobile":mobile,
                        "gender":"Male",
                        "doctor_category_id":"2",
                        "status":"1",
                        "device_id":"2",
                        "device_token":"3dfasdfasd44",
                        "device_type":"ios"
                    ]
                    
                    self.register(paramters: params)
                }
            }
            catch{
                
            }
        }
    }
}



