//
//  LocationMapAnnotationView.swift
//  SwiftUiMapApp
//
//  Created by Bora ÖZKOÇ on 22.08.2024.
//

import SwiftUI

struct LocationMapAnnotationView: View {
    
    
    let accentColor = Color("AccentColor")
    
    var body: some View {
        VStack(spacing: 0){
            Image(systemName: "map.circle.fill")
                .resizable()
                .scaledToFill()
                .frame(width: 30,height: 30)
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .background(accentColor)
                .clipShape(Circle())
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(accentColor)
                .frame(width: 10,height: 10)
                .rotationEffect(Angle(degrees: 180))
                .offset(y: -3)
                .padding(.bottom, 40)
        }
    }
}

#Preview {
    ZStack {
        Color.green.ignoresSafeArea()
        
        LocationMapAnnotationView()

    }
}
