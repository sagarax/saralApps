//
//  IntersectionCamera.swift
//  YYCTraffic
//
//  Created by Sagar Haval on 2022-11-20.
//

import Foundation

struct IntersectionCamera: Codable {
    let camera_url: CameraURL
    let quadrant: String
    let camera_location: String
    let point: LocationPoint
}

extension IntersectionCamera: Identifiable {
    var id: String { return camera_location}
}

struct CameraURL: Codable {
    let url: String
    let description: String
}

struct LocationPoint : Codable {
    let type: String
    let coordinates: [Double]
}
