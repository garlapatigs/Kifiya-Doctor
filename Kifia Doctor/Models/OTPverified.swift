//
//  OTPverified.swift
//  Kifia Doctor
//
//  Created by apple on 21/08/20.
//  Copyright © 2020 apple. All rights reserved.
//

import Foundation
//
//struct OTPverified : Codable{
//
//    let first_name: String?
//    let last_name: String?
//    let password: String?
//    let password_confirmation: String?
//    let email: String?
//    let mobile: String?
//    let gender: String?
//    let doctor_category_id : String?
//    let status : String?
//    let device_id: String?
//    let device_token: String?
//    let device_type: String?
//    let error: String?
//
//
//}

struct OTPverified: Codable {
    let status: Bool
    let data: DoctorVerifiedDataClass
}

// MARK: - DataClass
struct DoctorVerifiedDataClass: Codable {
    let doctor: DoctorVerifiedDoctor
    let accessToken: String

    enum CodingKeys: String, CodingKey {
        case doctor
        case accessToken = "access_token"
    }
}

// MARK: - Doctor
struct DoctorVerifiedDoctor: Codable {
    let id: Int
    let firstName, lastName, gender, email: String
    let mobile: String
    let doctorCategoryID, status: Int
    let createdAt, updatedAt: String
    let device: [Device]
    let doctorCategory: DoctorVerifiedDoctorCategory

    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case gender, email, mobile
        case doctorCategoryID = "doctor_category_id"
        case status
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case device
        case doctorCategory = "doctor_category"
    }
}

// MARK: - Device
struct DoctorVerifiedDevice: Codable {
    let id, doctorID: Int
    let deviceID, deviceToken, deviceType, createdAt: String
    let updatedAt: String

    enum CodingKeys: String, CodingKey {
        case id
        case doctorID = "doctor_id"
        case deviceID = "device_id"
        case deviceToken = "device_token"
        case deviceType = "device_type"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

// MARK: - DoctorCategory
struct DoctorVerifiedDoctorCategory: Codable {
    let id: Int
    let name: String
    let status: Int
    let createdAt, updatedAt: String

    enum CodingKeys: String, CodingKey {
        case id, name, status
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
