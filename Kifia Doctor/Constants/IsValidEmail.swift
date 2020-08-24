//
//  IsValidEmail.swift
//  Kifia Doctor
//
//  Created by apple on 20/08/20.
//  Copyright © 2020 apple. All rights reserved.
//

import Foundation
import UIKit

class Constants: NSObject {
    static func isValidEmail(str: String) -> Bool{
        let emailRegEx = "(?:[a-zA-Z0-9!#$%\\&‘*+/=?\\^_`{|}~-]+(?:\\.[a-zA-Z0-9!#$%\\&'*+/=?\\^_`{|}"
        + "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"
        + "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"
        + "z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"
        + "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"
        + "9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"
        + "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"

        let emailTest = NSPredicate(format:"SELF MATCHES %@",emailRegEx)
        return emailTest.evaluate(with: str)
    }
}

struct Defaults {
    static func setLoginData(_ response: Data?){
        UserDefaults.standard.set(response, forKey: "loginData")
        UserDefaults.standard.synchronize()
    }
//    static func getLoginData() -> [String : Any] {
//        let loginData = UserDefaults.standard.object(forKey: "login") as? [String : Any]
//        return loginData ?? [String : Any]()
//    }
    
    func getLoginInfoDataFormat() -> Data{
        let loginData = UserDefaults.standard.object(forKey: "loginData") as? Data
        return loginData ?? Data()
    }

    static func setAccessToken(_ response:Any?){
        UserDefaults.standard.set(response, forKey: "access")
        UserDefaults.standard.synchronize()
    }
    
    static func getAccessToken()-> String{
        let access = UserDefaults.standard.object(forKey: "access") as? String
        return access ?? ""
    }
}
