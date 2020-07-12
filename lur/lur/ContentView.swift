//
//  ContentView.swift
//  lur
//
//  Created by Elijah Valine on 5/23/20.
//  Copyright © 2020 Elijah Valine. All rights reserved.
//

import SwiftUI
import MapKit

struct MapViewAdvance: UIViewRepresentable {
  @Binding var checkpoints: [FishCheckpoint]
  
  func makeUIView(context: Context) -> MKMapView {
    MKMapView()
  }
  
  func updateUIView(_ uiView: MKMapView, context: Context) {
    uiView.addAnnotations(checkpoints)
  }
}

struct ContentView: View {
    @State var checkpoints: [FishCheckpoint] = [
      FishCheckpoint(title: "Da Nang", coordinate: .init(latitude: 16.047079, longitude: 108.206230)),
      FishCheckpoint(title: "Ha Noi", coordinate: .init(latitude: 21.027763, longitude: 105.834160))
    ]
    
    var body: some View {
      MapViewAdvance(checkpoints: $checkpoints)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
