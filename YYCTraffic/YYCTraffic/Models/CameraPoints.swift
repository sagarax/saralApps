//
//  TrafficPoint.swift
//  YYCTraffic
//
//  Created by Sagar Haval on 2022-11-19.
//
import Foundation
import CoreLocation

struct CameraPoints: Identifiable {
    let id = UUID()
    let url: String
    let name: String
    let camera_location: String
    let coordinate: CLLocationCoordinate2D
}
