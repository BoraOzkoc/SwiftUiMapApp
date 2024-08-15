//
//  LocationsViewModel.swift
//  SwiftUiMapApp
//
//  Created by Bora ÖZKOÇ on 15.08.2024.
//

import Foundation
import MapKit
import SwiftUI

class LocationsViewModel: ObservableObject{
    
    @Published var Locations: [Location]
    
    @Published var mapLocation: Location{
        didSet{
            updateMapRegion(location: mapLocation)
        }
    }
    
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    @Published var showLocationList: Bool = false
    init() {
        let locations = LocationsDataService.locations
        self.Locations = locations
        self.mapLocation = locations.first!
        self.updateMapRegion(location: locations.first!)
    }
    private func updateMapRegion(location: Location){
        
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(center: location.coordinates, span: mapSpan)

        }
    }
    func toggleLocationsList(){
        withAnimation(.easeInOut){
            showLocationList = !showLocationList
        }
    }
    func showNextLocation(location: Location){
        withAnimation(.easeInOut){
            mapLocation = location
            showLocationList = false
            
        }
    }
}
