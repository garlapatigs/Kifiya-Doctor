//
//  SignUpModel.swift
//  Kifia Doctor
//
//  Created by apple on 19/08/20.
//  Copyright © 2020 apple. All rights reserved.
//

import Foundation
struct SignUp : Codable {
    let first_name: String?
    let last_name: String?
    let password: String?
    let password_confirmation: String?
    let email: String?
    let mobile: String?
    let gender: String?
    let doctor_category_id : String?
    let status : String?
    let device_id: String?
    let device_token: String?
    let device_type: String?
    let error: String?
    let message: String?
    let otp: Int?

}


