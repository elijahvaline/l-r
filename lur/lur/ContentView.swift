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
    
    @State var checkpoints: [FishCheckpoint] = []
    @State var serverResponse = "hello"
    @ObservedObject private var locationManager = LocationManager()
    let fishy:Color = Color(red: 38/255, green: 138/255, blue: 255/255)
    
    
    
    var body: some View {
        
        return VStack {
            
            ZStack{
                
                MapViewAdvance(checkpoints: $checkpoints)
                               .edgesIgnoringSafeArea(.all)
                               .onAppear() {
                                   
                                   var coor:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 0, longitude: 0)
                                   var curCheck:FishCheckpoint = FishCheckpoint(title: "First", subtitle: "First", coordinate: coor)
                                   
                                   ServerUtils.getFish(returnWith:  { response in
                                       let fishSet:DataSet = response
                                       let size = fishSet.fish.count
                                       var curFish:SingleFish
                                       
                                       for n in 0...size-1 {
                                           print("Here")
                                           curFish = fishSet.fish[n]
                                           coor.latitude = curFish.latitude
                                           coor.longitude = curFish.longitude
                                           curCheck = FishCheckpoint(title: "Kind", subtitle: "Date", coordinate: coor)
                                           self.checkpoints.append(curCheck)
                                           
                                       }
                                       coor = CLLocationCoordinate2D(latitude: 78.0, longitude: 50.3)
                                       curCheck = FishCheckpoint(title: "Fake Annotation", subtitle: "Test Again", coordinate: coor)
                                       self.checkpoints.append(curCheck)
                                       
                                   })
                                   
                           }
                
                
            }
            
           
            
            
           
       
                HStack(){
                    
                    Button(action: {
                        var coor:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 0, longitude: 0)
                        var curCheck:FishCheckpoint = FishCheckpoint(title: "First", subtitle: "First", coordinate: coor)
                        
                        ServerUtils.getFish(returnWith:  { response in
                            let fishSet:DataSet = response
                            let size = fishSet.fish.count
                            var curFish:SingleFish
                            
                            for n in 0...size-1 {
                                print("Here")
                                curFish = fishSet.fish[n]
                                coor.latitude = curFish.latitude
                                coor.longitude = curFish.longitude
                                curCheck = FishCheckpoint(title: "Kind", subtitle: "Date", coordinate: coor)
                                self.checkpoints.append(curCheck)
                                
                            }
                            coor = CLLocationCoordinate2D(latitude: 78.0, longitude: 50.3)
                            curCheck = FishCheckpoint(title: "Fake Annotation", subtitle: "Test Again", coordinate: coor)
                            self.checkpoints.append(curCheck)
                            
                        })
                    }) {
                        Image(systemName: "arrow.clockwise")
                            .font(.title)
                            .foregroundColor(.white)
                    }
                    .padding(.trailing, 300.0)
                    
                    
                    Button(action: {
                        
                        let coordinate = self.locationManager.location != nil ?
                            self.locationManager.location!.coordinate :
                            CLLocationCoordinate2D()
                        
                        ServerUtils.addFish(fishLatitude: coordinate.latitude, fishLongitude: coordinate.longitude, fishType: 1, fishSize: 1)
                        print("ok")
                        
                        print("Added")
                    }) {
                        Image(systemName: "plus")
                            .font(.title)
                            .foregroundColor(.white)
                        
                        
                    }
                    .padding(.leading, 0.0)
                    
                }.padding(.top).edgesIgnoringSafeArea(.bottom)
                
                
            
            
        }
        .padding(.bottom, 35.0)
        .background(Color.init(red: 38/255, green: 138/255, blue: 255/255))
        .edgesIgnoringSafeArea(.bottom)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

