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
}

class HealthInspectionServicesImpl: HealthInspectionServices {
    
    private let endpoint: String = "https://data.cityofnewyork.us/resource/nwxe-izdj.json"
    
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
            
            
        } catch {
            print(error)
        }
        
        return []
    }
    
    
}
