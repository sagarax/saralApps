//
//  ContentView.swift
//  ShareMyLocation
//
//  Created by Gaargi Haval on 2022-11-12.
//

import SwiftUI
import CoreLocationUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    
    var body: some View {
        VStack {
                    if let location = locationManager.location {
                        Text("Your location: \(location.latitude), \(location.longitude)")
                    }

                    LocationButton {
                        locationManager.requestLocation()
                    }
                    .frame(height: 44)
                    .padding()
                }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
