//
//  NycHealthInspectionsApp.swift
//  NycHealthInspections
//
//  Created by Carlos Ramirez on 3/15/25.
//

import SwiftUI

@main
struct NycHealthInspectionsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel:
                            HealthInspectionViewModel(service:
                            HealthInspectionServicesImpl()))
        }
    }
}
