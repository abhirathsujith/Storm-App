//
//  WelcomeView.swift
//  Storm
//
//  Created by Abhirath Sujith on 09/07/22.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    
    @EnvironmentObject var locationManager: LocationManager
    
    var body: some View {
        VStack{
            VStack(spacing: 20){
                Text("STORM")
                    .bold().font(.title)
                
                Text("Allow Location")
                    .padding()
            }
            .multilineTextAlignment(.center)
            .padding()
            
            LocationButton(.shareCurrentLocation) {
                locationManager.requestLocation()
            }
            .cornerRadius(40)
            .symbolVariant(.fill)
            .foregroundColor(.white)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity )
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
