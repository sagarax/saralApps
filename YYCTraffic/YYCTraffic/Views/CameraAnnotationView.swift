//
//  CameraAnnotationView.swift
//  YYCTraffic
//
//  Created by Sagar Haval on 2022-11-20.
//

import SwiftUI

struct CameraAnnotationView: View {
    @State private var showingPopover = false
    var imageURL: String
    let accentColor = Color(.blue)
    
    var body: some View {
        VStack(spacing: 0){
            Image(systemName:"camera")
                .resizable()
                .scaledToFit()
                .frame(width: 15, height: 15)
                .font(.headline)
                .foregroundColor(.white)
                .padding(6)
                .background(accentColor)
                .cornerRadius(36)
            
            Image(systemName:"triangle.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(accentColor)
                .frame(width: 5, height: 5)
                .rotationEffect(Angle(degrees: 180))
                .offset(y: -2)
        }
        .onTapGesture {
            showingPopover = true
        }
        .popover(isPresented: $showingPopover) {
            AsyncImage(url: URL(string: imageURL)){ image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                Color.red
            }
            //.frame(width: 250, height: 200)
            //.clipShape(RoundedRectangle(cornerRadius: 25))
        }
    }
}

struct CameraAnnotationView_Previews: PreviewProvider {
    static var previews: some View {
        CameraAnnotationView(imageURL: "https://trafficcam.calgary.ca/loc52.jpg")
    }
}
