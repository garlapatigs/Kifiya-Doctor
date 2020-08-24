//
//  Alert.swift
//  Kifia Doctor
//
//  Created by apple on 20/08/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

enum AlertType : String{
    
    case Empty = "Please Enter Your"
    case Invalid = "Please Enter Valid"
    case LessChar = "Please Enter Aleast 6 Character in"
    case Mobile = "Please Enter Aleast 10 Character in"
    case MisMatch = "Please Enter Same"
    case CodeMissing = "Please Enter 4 Digit Code Sended to your"

   
}
class Alert: NSObject {
    private static func ShowAlert(on vc: UIViewController, with title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
//        alert.addColorInTitleAndMessage(titleColor: .darkGray, messageColor: .lightGray, titleFont: <#T##UIFont#>, messageFont: <#T##UIFont#>)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        vc.present(alert,animated: true)
    }
    static func TextField(on vc: UIViewController,text:String,type : AlertType){
        var msg : String!
      
            msg = type.rawValue + " " + text
        
        ShowAlert(on: vc, with: text, message: msg)
    }
}
extension UIAlertController{

func addColorInTitleAndMessage(titleColor:UIColor,messageColor:UIColor,titleFont:UIFont, messageFont:UIFont){

    let attributesTitle = [NSAttributedString.Key.foregroundColor: titleColor, NSAttributedString.Key.font: titleFont]
    let attributesMessage = [NSAttributedString.Key.foregroundColor: messageColor, NSAttributedString.Key.font: messageFont]
    let attributedTitleText = NSAttributedString(string: self.title ?? "", attributes: attributesTitle)
    let attributedMessageText = NSAttributedString(string: self.message ?? "", attributes: attributesMessage)

    self.setValue(attributedTitleText, forKey: "attributedTitle")
    self.setValue(attributedMessageText, forKey: "attributedMessage")

}}

