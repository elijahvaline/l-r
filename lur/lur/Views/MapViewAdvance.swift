//
//  MapViewAdvance.swift
//  lur
//
//  Created by Elijah Valine on 7/20/20.
//  Copyright © 2020 Elijah Valine. All rights reserved.
//

import SwiftUI
import MapKit

struct MapViewAdvance: UIViewRepresentable {
    
  @Binding var checkpoints: [FishCheckpoint]

    func makeUIView(context: Context) -> MKMapView {
       let map = MKMapView()
        map.showsUserLocation = true
        map.delegate = context.coordinator
        return map
        
  }
  
  func updateUIView(_ uiView: MKMapView, context: Context) {
    
    uiView.delegate = context.coordinator

    uiView.removeAnnotations(uiView.annotations)
    uiView.addAnnotations(checkpoints)
    
  }
    
    func makeCoordinator() -> MapViewCoordinator {
        MapViewCoordinator(self)
    }

}

