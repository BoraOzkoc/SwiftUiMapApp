//
//  LocationsView.swift
//  SwiftUiMapApp
//
//  Created by Bora ÖZKOÇ on 15.08.2024.
//

import SwiftUI

class LocationsViewModel: ObservableObject{
    @Published var Locations: [Location]
    
    init(Locations: [Location]) {
        let locations = LocationsDataService.locations
        self.Locations = locations
    }
}

struct LocationsView: View {
    
    @StateObject private var vm = LocationsViewModel()
    
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    LocationsViewModel()
}
