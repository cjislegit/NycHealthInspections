//
//  HealthInspectionServices.swift
//  NycHealthInspections
//
//  Created by Carlos Ramirez on 3/15/25.
//

import Foundation

protocol HealthInspectionServices {
    func fetchHealthInspectionData() async throws -> [HealthInspectionModel]
}

enum HealthInspectionServiceError: Error {
    case urlError
    case httpURLError
    case statusCodeError
    case unknownError(errorMessage: String)
}

class HealthInspectionServicesImpl: HealthInspectionServices {
    
    private let endpoint: String = "https://data.cityofnewyork.us/resource/43nn-pn8j.json"
    
    func fetchHealthInspectionData() async throws -> [HealthInspectionModel] {
        guard let url = URL(string: endpoint) else {
            throw HealthInspectionServiceError.urlError
        }
        
        do{
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let httpURLResponse = response as? HTTPURLResponse else {
                throw HealthInspectionServiceError.httpURLError
            }
            
            guard (200..<300).contains(httpURLResponse.statusCode) else {
                throw HealthInspectionServiceError.statusCodeError
            }
            
            let jsonDecoder = JSONDecoder()
            
            let inspections = try jsonDecoder.decode([HealthInspectionModel].self, from: data)
            
            return inspections
            
            
        } catch {
            throw HealthInspectionServiceError.unknownError(errorMessage: error.localizedDescription)
        }

    }
    
    
}
