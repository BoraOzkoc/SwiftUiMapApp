//
//  LocationsListView.swift
//  SwiftUiMapApp
//
//  Created by Bora ÖZKOÇ on 16.08.2024.
//

import SwiftUI

struct LocationsListView: View {
    
    @EnvironmentObject private var vm: LocationsViewModel
    var body: some View {
        List{
            ForEach(vm.Locations){location in
            Button{
                vm.showNextLocation(location: location)
            } label: {
                listRowView(location: location  )
            }
            .padding(.vertical,4)
            .listRowBackground(Color.clear)
          }
        }
        .listStyle(PlainListStyle())
    }
}

#Preview {
    LocationsListView()
        .environmentObject(LocationsViewModel())
}
extension LocationsListView{
    private func listRowView(location: Location) -> some View {
        HStack{
            if let imageName = location.imageNames.first{
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 45,height: 45)
                    .cornerRadius(10)
                
            }
            
            VStack(alignment: .leading){
                Text(location.name)
                Text(location.cityName)
            }
            .frame(maxWidth:  .infinity,alignment: .leading)
        }
    }
}
