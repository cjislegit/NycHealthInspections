//
//  Models.swift
//  NycHealthInspections
//
//  Created by Carlos Ramirez on 3/15/25.
//

import Foundation

struct HealthInspectionModel: Decodable {
    let dba: String
    let street: String
    let cuisineDescription: String?
    let violationDescription: String?
    let inspectionDate: String?
}
