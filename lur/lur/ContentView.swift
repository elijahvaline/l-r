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
    
    uiView.delegate = context.coordinator
    uiView.addAnnotations(checkpoints)
  }
    
    func makeCoordinator() -> MapViewCoordinator {
        MapViewCoordinator(self)
    }

}

struct ContentView: View {
    @State var checkpoints: [FishCheckpoint] = [
        FishCheckpoint(title: "Da Nang", subtitle: "Hole", coordinate: .init(latitude: 16.047079, longitude: 108.206230)),
        FishCheckpoint(title: "Ha Noi", subtitle: "Hello THere", coordinate: .init(latitude: 21.027763, longitude: 105.834160))
    ]
  
    @State var serverResponse = "hello"
    var body: some View {
        VStack {

            MapViewAdvance(checkpoints: $checkpoints)
            HStack {
                Text(serverResponse)
                Button(action: {
                let server = ServerUtils()
                    server.getServerVersion(returnWith: { response in
                        self.serverResponse = response
                    })
               }) {
                   Text("Run on server")
               }
                
            }
        }
      
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

class MapViewCoordinator: NSObject, MKMapViewDelegate{
    
    var mapViewController: MapViewAdvance
    
    init(_ control: MapViewAdvance){
        
        self.mapViewController = control
    }
    func mapView(_ mapView: MKMapView, viewFor
        annotation: MKAnnotation) -> MKAnnotationView?{
        
        let identifier = "Hello"
//
//       var annotationView = MKAnnotationView()
//               annotationView.canShowCallout = true
//
//
//       annotationView.canShowCallout = true
//       annotationView.image = UIImage(named: "Bluefish")
//        
//
        var annotationView = MKMarkerAnnotationView()
                   annotationView.canShowCallout = true


            annotationView.markerTintColor = .some(.systemBlue)
            annotationView.glyphImage = UIImage(named: "Bluefish")

        
        annotationView.clusteringIdentifier = identifier
       return annotationView
    }
}


