//
//  ContentView.swift
//  WhereAmI
//
//  Created by Sagar Haval on 2022-11-13.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    @State var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 50.923704, longitude: -113.944013), span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))

    var body: some View {
        Map(coordinateRegion: $region, interactionModes: .all, showsUserLocation: true, userTrackingMode: .constant(.follow))
            .frame(width: 400, height: 700)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
