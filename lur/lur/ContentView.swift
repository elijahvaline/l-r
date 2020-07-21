//
//  ContentView.swift
//  lur
//
//  Created by Elijah Valine on 5/23/20.
//  Copyright © 2020 Elijah Valine. All rights reserved.
//

import SwiftUI
import MapKit
import CoreLocation


struct ContentView: View {


    @State var checkpoints: [FishCheckpoint] = [
        FishCheckpoint(title: "Da Nang", subtitle: "Hole", coordinate: .init(latitude: 16.047079, longitude: 108.206230)),
        FishCheckpoint(title: "Ha Noi", subtitle: "Hello THere", coordinate: .init(latitude: 21.027763, longitude: 105.834160)),
        
        FishCheckpoint(title: "hello", subtitle: "Hole", coordinate: .init(latitude: 45.047079, longitude: 78.206230)),
        FishCheckpoint(title: "Ha Noi", subtitle: "Hello THere", coordinate: .init(latitude: 41.027763, longitude: 70.834160))
    ]

    @State var serverResponse = "hello"
    @ObservedObject private var locationManager = LocationManager()
    
    var body: some View {
        
        let coordinate = self.locationManager.location != nil ?
            self.locationManager.location!.coordinate :
            CLLocationCoordinate2D()

           return VStack {
            
             ZStack{
                MapViewAdvance(checkpoints: $checkpoints)
                                                 .edgesIgnoringSafeArea(.all)
                Text("\(coordinate.latitude),  \(coordinate.longitude)")
                    .foregroundColor(Color.white)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(10)
                
            }
               
            HStack {
                Text(serverResponse)
                Button(action: {
                    ServerUtils.getServerHelloWorld(returnWith: { response in
                        self.serverResponse = response
                    })
               }) {
                   Text("HelloWorld")
               }

                 Button(action: {

                     ServerUtils.getServerVersion(returnWith: { response in
                         self.serverResponse = response
                     })
                }) {
                    Text("GetVersion")
                }
                
                Button(action: {
                    ServerUtils.addFish()
                  }) {
                      Text("AddFish")
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

