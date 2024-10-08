//
//  SwiftUiMapAppApp.swift
//  SwiftUiMapApp
//
//  Created by Bora ÖZKOÇ on 15.08.2024.
//

import SwiftUI

@main
struct SwiftUiMapAppApp: App {
    
    
    @StateObject private var vm = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(vm)
        }
    }
}
