//
//  OTPVerifyVC.swift
//  Kifia Doctor
//
//  Created by apple on 20/08/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class OTPVerifyVC: UIViewController, UITextFieldDelegate {
    
    var otpVerify: OTPverified!
    private var otp:String!
    private var name:String!
    private var email:String!
    private var pwd:String!
    private var confirmPwd:String!
    private var mob:String!
    @IBOutlet weak var otpTF1: UITextField!
    @IBOutlet weak var otpTF2: UITextField!
    @IBOutlet weak var otpTF3: UITextField!
    @IBOutlet weak var otpTF4: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        otpTF1.becomeFirstResponder()
        addBottomBorderTo(textField: otpTF1)
        addBottomBorderTo(textField: otpTF2)
        addBottomBorderTo(textField: otpTF3)
        addBottomBorderTo(textField: otpTF4)
        otpTF1.setLeftPaddingPoints(otpTF1.frame.width/2)
        otpTF2.setLeftPaddingPoints(otpTF2.frame.width/2)
        otpTF3.setLeftPaddingPoints(otpTF3.frame.width/2)
        otpTF4.setLeftPaddingPoints(otpTF4.frame.width/2)
        otpTF1.delegate = self
        otpTF2.delegate = self
        otpTF3.delegate = self
        otpTF4.delegate = self
        // Do any additional setup after loading the view.
    }
    func params(otp:String, name:String, pwd:String, confirmPwd:String, email:String, mobile:String){
        self.otp = otp
        self.name = name
        self.email = email
        self.mob = mobile
        self.pwd = pwd
        self.confirmPwd = confirmPwd
    }
    @IBAction func backBtnAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func submitBtnAction(_ sender: UIButton) {
        
        guard let otp1 = otpTF1.text, otp1.count != 0 else{
            Alert.TextField(on: self, text: "OTP", type: .Empty)
            return
        }
        guard let otp2 = otpTF2.text, otp2.count != 0 else{
            Alert.TextField(on: self, text: "OTP", type: .Empty)
            return
        }
        guard let otp3 = otpTF3.text, otp3.count != 0 else{
            Alert.TextField(on: self, text: "OTP", type: .Empty)
            return
        }
        guard let otp4 = otpTF4.text, otp4.count != 0 else{
            Alert.TextField(on: self, text: "OTP", type: .Empty)
            return
        }
        print(name!, pwd!, confirmPwd!,email!, mob!)
        var params:[String:Any] = [
            "first_name":name!,
            "last_name":"G",
            "password":pwd!,
            "password_confirmation":confirmPwd!,
            "email":email!,
            "mobile":mob!,
            "gender":"Male",
            "doctor_category_id":"2",
            "status":"1",
            "device_id":"2",
            "device_token":"3dfasdfasd44",
            "device_type":"ios"
        ]
        
        if self.otp! == otp1+otp2+otp3+otp4{
             OTPverify(params: params)
        }
        else{
             Toast.makeToast(message: "Invalid OTP", in: self.view)
        }
            
    }
    
    func OTPverify(params:[String:Any]){
        WebService.shared.postMethod(Api: .otp_verified, parameter: params) { (response) -> (Void) in
            print(response)
                               do{
                                print("1234")
                                   let json = try JSONDecoder().decode(OTPverified.self, from: response)
                                   print(json)
//                                   if let msg = json.message{
//                                       if msg == "OTP (One Time Password) sent to registered e-mail" {
//                                           print("msg: ",msg)
//                                       } else { return}
//                                   }
//                                   if let err = json.error{
//                                       print("err: ", err)
//                                   }
                                 //  self.otpVerify = json
                                   
                                   let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                                   let vc = storyBoard.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC


                                   vc.modalPresentationStyle = .fullScreen
                                   self.navigationController?.pushViewController(vc, animated: true)
                               }
                   
                               catch let err{
                                print(err.localizedDescription)
                               }
                           }
    }
    
    func addBottomBorderTo(textField:UITextField) {
           let layer = CALayer()
           layer.backgroundColor = UIColor.gray.cgColor
           layer.frame = CGRect(x: 0.0, y: textField.frame.size.height - 2.0, width: textField.frame.size.width, height: 2.0)
           textField.layer.addSublayer(layer)
       }
    
    
    //MARK:- textfield Delegate
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
           if ((textField.text?.count)! < 1 ) && (string.count > 0) {
               if textField == otpTF1 {
                   otpTF2.becomeFirstResponder()
               }
               
               if textField == otpTF2 {
                   otpTF3.becomeFirstResponder()
               }
               
               if textField == otpTF3 {
                   otpTF4.becomeFirstResponder()
               }
               
               if textField == otpTF4 {
                   otpTF4.resignFirstResponder()
               }
               
               textField.text = string
               return false
           } else if ((textField.text?.count)! >= 1) && (string.count == 0) {
               if textField == otpTF2 {
                   otpTF1.becomeFirstResponder()
               }
               if textField == otpTF3 {
                   otpTF2.becomeFirstResponder()
               }
               if textField == otpTF4 {
                   otpTF3.becomeFirstResponder()
               }
               if textField == otpTF1 {
                   otpTF1.resignFirstResponder()
               }
               
               textField.text = ""
               return false
           } else if (textField.text?.count)! >= 1 {
               textField.text = string
               return false
           }
        return true
       }
}

