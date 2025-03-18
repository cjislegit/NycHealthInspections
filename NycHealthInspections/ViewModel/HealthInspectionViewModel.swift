//
//  HealthInspectionViewModel.swift
//  NycHealthInspections
//
//  Created by Carlos Ramirez on 3/17/25.
//

import Foundation

class HealthInspectionViewModel {
    let service: HealthInspectionServices
    
    init(service: HealthInspectionServices) {
        self.service = service
    }
    
    func fetchHealthInspectionData() async {
        do {
            let inspections = try await service.fetchHealthInspectionData()
            print(inspections)
        } catch {
            print(error)
        }
    }
}
