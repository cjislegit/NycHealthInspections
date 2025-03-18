//
//  ContentView.swift
//  NycHealthInspections
//
//  Created by Carlos Ramirez on 3/15/25.
//

import SwiftUI

struct ContentView: View {
    var viewModel: HealthInspectionViewModel
    
    var body: some View {
        NavigationStack{
            VStack{
                
                List{
                    VStack(alignment: .leading) {
                        HStack(alignment: .top) {
                            VStack(alignment: .leading) {
                                Text("Name of Business")
                                Text("Address of Business")
                            }
                            
                            Spacer()
                            
                            Text("Mexican")
                            
                        }
                        .padding(.bottom)
                        
                        Text("Health inspection violation")
                        
                        Divider()
                        
                        Text("March 16, 2025")
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                }
                
            }
            .navigationTitle(Text("NYC Health Inspections"))
            .task {await viewModel.fetchHealthInspectionData()}
        }
    }
}

#Preview {
    ContentView(viewModel: HealthInspectionViewModel(service: HealthInspectionServicesImpl()))
}
