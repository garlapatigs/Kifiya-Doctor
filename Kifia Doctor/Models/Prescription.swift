//
//  Prescription.swift
//  Kifia Doctor
//
//  Created by apple on 24/08/20.
//  Copyright © 2020 apple. All rights reserved.
//

import Foundation

// MARK: - Welcome
struct PrescriptionModel: Codable {
    let status: Int
    let data: PrescriptionModelDataClass
}

// MARK: - DataClass
struct PrescriptionModelDataClass: Codable {
    let prescription: [Prescription]
}

// MARK: - Prescription
struct Prescription: Codable {
    let id, userID, doctorID, status: Int
    let createdAt, updatedAt: String
    let prescriptionDetails: [PrescriptionDetail]
    let user: User

    enum CodingKeys: String, CodingKey {
        case id
        case userID = "user_id"
        case doctorID = "doctor_id"
        case status
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case prescriptionDetails = "prescription_details"
        case user
    }
}

// MARK: - PrescriptionDetail
struct PrescriptionDetail: Codable {
    let id, prescriptionID: Int
    let medicineName: String
    let quantity: Int
    let createdAt, updatedAt: String

    enum CodingKeys: String, CodingKey {
        case id
        case prescriptionID = "prescription_id"
        case medicineName = "medicine_name"
        case quantity
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

// MARK: - User
struct User: Codable {
    let id: Int
    let firstName: String
    let mobile: String

    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case mobile
    }
}

enum FirstName: String, Codable {
    case agent = "agent"
    case arun = "arun"
    case prasath = "prasath"
}
