//
//  ResetPasswordVC.swift
//  Kifia Doctor
//
//  Created by apple on 06/08/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class ResetPasswordVC: UIViewController {
    var forgotPassWord: ForgotPasswordModel?
    @IBOutlet weak var newPasswordTF: UITextField!
    @IBOutlet weak var codeTF: UITextField! {
        didSet{
            codeTF.keyboardType = .numberPad
        }
    }
    @IBOutlet weak var retypePasswordTF: UITextField!
    @IBOutlet weak var changePasswordBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
         navigationItem.hidesBackButton = true
        
        newPasswordTF.withImage(direction: .Right, image: UIImage(named: "eye")!, colorSeparator: .white, colorBorder: .white)
        retypePasswordTF.withImage(direction: .Right, image: UIImage(named: "eye")!, colorSeparator: .white, colorBorder: .white)
                codeTF.border(textField: codeTF)
               retypePasswordTF.border(textField: retypePasswordTF)
               newPasswordTF.border(textField: newPasswordTF)
        changePasswordBtn.corner(button: changePasswordBtn)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backBtnAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        
        
    }
    
    @IBAction func changePasswordAction(_ sender: UIButton) {
        
        guard let code = codeTF.text, code.count != 0 else {
            Alert.TextField(on: self, text: "Code", type: .Empty)
            return
        }
        guard let password = newPasswordTF.text, password.count != 0 else {
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
        
        print("sai")
        
        var params: [String:Any] = [
            "password" : password,
            "password_confirmation": confirmpassword,
            "id":forgotPassWord?.doctor.id ?? ""]
        print("id is: ",forgotPassWord!.otp)
        if "\(forgotPassWord!.otp)" == code {
            ResetPassword(params: params)
        }
        else{
            
            Toast.makeToast(message: "Enter Valid Code", in: self.view)
        }
        
    }
    
    func ResetPassword(params:[String:Any]){
        
        WebService.shared.postMethod(Api: .reset_password, parameter: params) { (response) -> (Void) in
            
            do{
                let json = try JSONDecoder().decode(Reset.self, from: response)
                print(json)
                
                if json.message == "Password changed successfully" {
                    
                    guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as? LoginVC else{return}
                                       vc.modalPresentationStyle = .fullScreen
                    self.navigationController?.pushViewController(vc, animated: true)
                    
                }
            }
            catch{
                print(error.localizedDescription)
            }
        }
    }
    
}
