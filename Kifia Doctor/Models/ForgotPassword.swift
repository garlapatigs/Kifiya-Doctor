//
//  ForgotPassword.swift
//  Kifia Doctor
//
//  Created by apple on 24/08/20.
//  Copyright © 2020 apple. All rights reserved.
//

import Foundation


struct ForgotPasswordModel: Codable {
    let message: String
    let doctor: ForgotPasswordDoctor
    let otp: Int
}

// MARK: - Doctor
struct ForgotPasswordDoctor: Codable {
    let id: Int
    let firstName, lastName, gender, email: String
    let mobile: String
    let doctorCategoryID, status: Int
    let createdAt, updatedAt: String

    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case gender, email, mobile
        case doctorCategoryID = "doctor_category_id"
        case status
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}


struct Reset: Codable {
    let message: String?
}
