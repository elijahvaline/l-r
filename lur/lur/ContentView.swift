//
//  ContentView.swift
//  lür
//
//  Created by Elijah Valine on 5/23/20.
//  Copyright © 2020 Elijah Valine. All rights reserved.
//

import SwiftUI
import MapKit
import CoreLocation


struct ContentView: View {
    
    var screenWidth  = UIScreen.main.bounds.width
    var screenHeight = UIScreen.main.bounds.height
    @State var checkpoints: [FishCheckpoint] = []
    @State var emptyCheckpoints: [FishCheckpoint] = []
    @State var serverResponse = "hello"
    @ObservedObject private var locationManager = LocationManager()
    let fishy:Color = Color(red: 39/255, green: 113/255, blue: 255/255)
    
    
    
    var body: some View {
        
        NavigationView{
        
        return VStack {
            
            
            
            MapViewAdvance(checkpoints: $checkpoints)
                .edgesIgnoringSafeArea(.all)
                .onAppear() {
                    var coor:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 0, longitude: 0)
                    var curCheck:FishCheckpoint = FishCheckpoint(title: "First", subtitle: "First", coordinate: coor)
                    
                    ServerUtils.getFish(returnWith:  { response in
                        let fishSet:DataSet = response
                        _ = fishSet.fish.count
                        var curFish:SingleFish
                        
                        for fish in fishSet.fish {
                            print("Here")
                            curFish = fish
                            coor.latitude = curFish.latitude
                            coor.longitude = curFish.longitude
                            curCheck = FishCheckpoint(title: "Kind", subtitle: "Date", coordinate: coor)
                            self.checkpoints.append(curCheck)
                            
                        }
                        coor = CLLocationCoordinate2D(latitude: 78.0, longitude: 50.3)
                        curCheck = FishCheckpoint(title: "Fake Annotation", subtitle: "Test Again", coordinate: coor)
                        self.checkpoints.append(curCheck)
                        
                        coor = CLLocationCoordinate2D(latitude: 76.0, longitude: 48)
                        curCheck = FishCheckpoint(title: "Fake Annotation", subtitle: "Test Again", coordinate: coor)
                        self.checkpoints.append(curCheck)
                        
                    })
                    
            }
            
            
            HStack(){
                
                Button(action: {
                    var _: [FishCheckpoint] = []
                    var coor:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 0, longitude: 0)
                    var curCheck:FishCheckpoint = FishCheckpoint(title: "First", subtitle: "First", coordinate: coor)
                    
                    
                    print("refresh")
                    print(self.checkpoints.count)
                    
                    
                    
                    ServerUtils.getFish(returnWith:  { response in
                        self.checkpoints.removeAll()
                        let fishSet:DataSet = response
                        _ = self.checkpoints.count
                        print(fishSet.fish.count)
                        
                        _ = fishSet.fish.count
                        var curFish:SingleFish
                        
                        for fish in fishSet.fish {
                            print("Here")
                            curFish = fish
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
                    .font(.system(size: 40))
                }
                
                
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
                    .font(.system(size: 40))
                    
                    
                }
                .padding(.horizontal, (screenWidth/2) - 90)
               
                
                NavigationLink(destination: NewFishView()) {
                              Image(systemName: "umbrella.fill")
                    }.foregroundColor(.white)
                .font(.system(size: 35))
                
            }.padding(.top).edgesIgnoringSafeArea(.bottom)
            
            
            
          
            
            
        }
        .padding(.bottom, 35.0)
        .background(Color.init(red: 38/255, green: 138/255, blue: 255/255))
        .edgesIgnoringSafeArea(.bottom)
        
        }
    }
    
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SomeView: View {
    var body: some View {
        Text("Detailed View")
    }
}

