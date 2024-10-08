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
    
    @Published var sheetLocation: Location? = nil
    
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
    func nextButtonPressed() {
        
        guard let currentIndex = Locations.firstIndex(where: { $0 == mapLocation }) else {
            return
        }
        
        let nextIndex = currentIndex + 1
        
        guard Locations.indices.contains(nextIndex) else{
            guard let firstLocation = Locations.first else {return}
            showNextLocation(location: firstLocation)
            return
        }
        
        let nextLocation = Locations[nextIndex]
        
        showNextLocation(location: nextLocation)
    }
}
