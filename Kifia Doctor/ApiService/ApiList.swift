//
//  ApiList.swift
//  Kifia Doctor
//
//  Created by apple on 19/08/20.
//  Copyright © 2020 apple. All rights reserved.
//

import Foundation

let baseUrl = "http://178.128.38.51/"

enum Base: String{
    
    case login = "api/doctor/login"
    case register = "api/doctor/register"
    case otp_verified = "api/doctor/otp_verified"
    case logout = "api/doctor/logout"
    case forgot_password = "api/doctor/forgot_password"
    case reset_password = "api/doctor/reset_password"
    case update_doctor = "api/doctor/update_doctor"
    case doctor_category = "api/doctor/doctor_category"
    case get_patients = "api/doctor/get_patients"
    case confirm_patient = "api/doctor/confirm_patient"
    case get_medicines = "api/doctor/get_medicines"
    case store_prescription = "api/doctor/store_prescription"
    case get_prescription_by_doctor = "api/doctor/get_prescription_by_doctor"
    case get_prescription_by_id = "api/doctor/get_prescription_by_id"
    case register_check = "api/doctor/register_check"
    
    init(fromRawValue: String){
        self = Base(rawValue: fromRawValue) ?? Base.register
    }
    
    static func valueFor(Key : String?)->Base{
            
            guard let key = Key else {
                return Base.register
            }
            
    //        for val in iterateEnum(Base.self) where val.rawValue == key {
    //            return val
    //        }
            
            if let base = Base(rawValue: key) {
                return base
            }
            
            return Base.register
            
        }
}
