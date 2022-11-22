//
//  ContentView.swift
//  YYCTraffic
//
//  Created by Sagar Haval on 2022-11-19.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.041333168, longitude: -114.067833062), span: MKCoordinateSpan(latitudeDelta: 0.08, longitudeDelta: 0.08))
    
    @State private var results = [IntersectionCamera]()
    var body: some View {
        VStack {
            Map(coordinateRegion: $region,
                interactionModes: .all,
                showsUserLocation: true,
                userTrackingMode: .constant(.follow),
                annotationItems: results)
            { intersectionCamera in
                MapAnnotation(coordinate: CLLocationCoordinate2D(latitude:intersectionCamera.point.coordinates[1], longitude: intersectionCamera.point.coordinates[0])) {
                    let replacedURL = intersectionCamera.camera_url.url.replacingOccurrences(of: "http:", with: "https:")
                    CameraAnnotationView(imageURL: replacedURL)
                }
            }
            //.frame(width: 400, height: 700)
        }
        .padding()
        
        .task {
            await loadYYCIntersectionCameras()
        }
    }
    
    func loadYYCIntersectionCameras() async {
        guard let url = URL(string: "https://data.calgary.ca/resource/k7p9-kppz.json") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode([IntersectionCamera].self, from: data) {
                results = decodedResponse
            }
        } catch {
            print("Invalid Data")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
