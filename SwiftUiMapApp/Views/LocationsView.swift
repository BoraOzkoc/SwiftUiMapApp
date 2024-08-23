//
//  LocationsView.swift
//  SwiftUiMapApp
//
//  Created by Bora ÖZKOÇ on 15.08.2024.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    
    @EnvironmentObject private var vm: LocationsViewModel
    @State private var mapRegion: MKCoordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    
    var body: some View {
        ZStack{
            mapLayer
                .ignoresSafeArea()
            
            VStack(spacing: 0){
                header
                    .padding()
                Spacer()
                locationsPreviewStack
            }
            
        }
    }
}

#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}
extension LocationsView{
    private var header: some View{
        
        VStack {
            Button(action: vm.toggleLocationsList){
                Text(vm.mapLocation.name + ", " + vm.mapLocation.cityName )
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundStyle(.primary)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .animation(.none, value: vm.mapLocation)
                    .overlay(alignment: .leading){
                        Image(systemName: "arrow.down")
                            .font(.headline)
                            .foregroundStyle(.primary)
                            .padding()
                            .rotationEffect(Angle(degrees: vm.showLocationList ? 180 : 0))
                    }
            }
            
            if vm.showLocationList{
                LocationsListView()
            }
            
        }
        .background(.thinMaterial)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
    }
    
    private var mapLayer: some View{
        
        Map(coordinateRegion: $vm.mapRegion,annotationItems: vm.Locations,annotationContent: {
            location in
            MapAnnotation(coordinate: location.coordinates){
                LocationMapAnnotationView()
                    .scaleEffect(vm.mapLocation == location ? 1 : 0.7)
                    .onTapGesture {
                        vm.showNextLocation(location: location)
                    }
            }
        })
    }
    
    private var locationsPreviewStack: some View {

            ZStack {
                ForEach(vm.Locations) { location in
                    if vm.mapLocation == location{
                        LocationPreviewView(location: location)
                            .shadow(color: Color.black.opacity(0.3), radius: 20, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                            .padding()
                            .transition(.asymmetric(insertion:   .move(edge: .trailing), removal: .move(edge: .leading)))
                    }
                }
                
            }
        }
}
