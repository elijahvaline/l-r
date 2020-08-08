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
    
    //filter states
    @State public var location = "all"
    @State public var date = "all"
    @State public var size = "all"
    @State public var type = "All"
    @State var locationServices = false
    
    let timer = Timer.publish(every: 600, on: .main, in: .common).autoconnect()
    
    
    
    @ObservedObject private var locationManager = LocationManager()
    let fishy:Color = Color(red: 39/255, green: 113/255, blue: 255/255)
    
    
    
    var body: some View {
        
       
      
        
        return NavigationView{
            
          if (self.locationServices == false){
            LocationServicesView(locationServices: $locationServices)
            }
            
            
            
            VStack {

                MapViewAdvance(checkpoints: $checkpoints)
                    .edgesIgnoringSafeArea(.all)

                HStack(){
                    
                    Button(action: {
                        
                        if (self.locationManager.location == nil){
                                         
                                          self.locationServices = false
                                      }
                                      else {
                                          self.locationServices = true
                                      }
                        
                        var _: [FishCheckpoint] = []
                        var coor:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 0, longitude: 0)
                        var curCheck:FishCheckpoint = FishCheckpoint(title: "First", subtitle: "First", coordinate: coor, color: "Blue", size: "huge")
                        let curcoor = self.locationManager.location != nil ?
                            self.locationManager.location!.coordinate :
                            CLLocationCoordinate2D()
                        
                        ServerUtils.getFish(latitude: curcoor.latitude, longitude: curcoor.longitude, date: self.date, location: self.location, size: self.size, type: self.type, returnWith:  { response in
                            self.checkpoints.removeAll()
                            let fishSet:DataSet = response
                            _ = self.checkpoints.count
                            
                            
                            _ = fishSet.fish.count
                            var curFish:SingleFish
                            
                            for fish in fishSet.fish {
                                
                                curFish = fish
                                coor.latitude = curFish.latitude
                                coor.longitude = curFish.longitude
                                
                                
                                let formatter = DateFormatter()
                                formatter.dateStyle = .short
                                let myNSDate = Date(timeIntervalSince1970: curFish.date)
                                let todaysDate:String = formatter.string(from: myNSDate)
                                
                                
                                curCheck = FishCheckpoint(title: curFish.type, subtitle: todaysDate, coordinate: coor, color: curFish.color, size: curFish.size)
                                
                                
                                self.checkpoints.append(curCheck)
                            }
                            
                            
                            
                        })
                    }) {
                        Image(systemName: "arrow.clockwise")
                            .font(.title)
                            .foregroundColor(.white)
                            .font(.system(size: 40))
                        
                        
                    }
                    
                    
                    NavigationLink(destination: FilterView(location: $location, date: $date, size: $size, type: $type)) {
                        //                         NavigationLink(destination: testView()) {
                        
                        Image(systemName: "line.horizontal.3.decrease.circle.fill")
                    }.foregroundColor(.white)
                        .font(.system(size: 35))
                        .padding(.horizontal, (screenWidth/2) - 90)
                        .disabled(!locationServices)
                    
                    
                    
                    NavigationLink(destination: NewFishView(checkpoints: self.$checkpoints, location: $location, date: $date, sizie: $size, type: $type)) {
                        Image(systemName: "umbrella.fill")
                    }.foregroundColor(.white)
                        .font(.system(size: 35))
                        .disabled(!locationServices)
                    
                }.padding(.top).edgesIgnoringSafeArea(.bottom).statusBar(hidden: true)
                
                
                
                
                
                
            }
            .padding(.bottom, 35.0)
            .background(Color.init(red: 38/255, green: 138/255, blue: 255/255))
            .edgesIgnoringSafeArea(.bottom)
            
        }.navigationBarTitle("Home")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            
           
            
            .onReceive(timer) { time in
                
                if (self.locationManager.location == nil){
                                  
                                  self.locationServices = false
                              }
                              else {
                                  self.locationServices = true
                              }
                
                
                var _: [FishCheckpoint] = []
                var coor:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 0, longitude: 0)
                var curCheck:FishCheckpoint = FishCheckpoint(title: "First", subtitle: "First", coordinate: coor, color: "Blue", size: "huge")
                
                
                let curcoor = self.locationManager.location != nil ?
                    self.locationManager.location!.coordinate :
                    CLLocationCoordinate2D()
                
                
                
                
                ServerUtils.getFish(latitude: curcoor.latitude, longitude: curcoor.longitude, date: self.date, location: self.location, size: self.size, type: self.type, returnWith:  { response in
                    self.checkpoints.removeAll()
                    let fishSet:DataSet = response
                    _ = self.checkpoints.count
                    
                    
                    _ = fishSet.fish.count
                    var curFish:SingleFish
                    
                    for fish in fishSet.fish {
                        
                        curFish = fish
                        coor.latitude = curFish.latitude
                        coor.longitude = curFish.longitude
                        
                        
                        let formatter = DateFormatter()
                        formatter.dateStyle = .short
                        let myNSDate = Date(timeIntervalSince1970: curFish.date)
                        let todaysDate:String = formatter.string(from: myNSDate)
                        
                        
                        curCheck = FishCheckpoint(title: curFish.type, subtitle: todaysDate, coordinate: coor, color: curFish.color, size: curFish.size)
                        
                        
                        self.checkpoints.append(curCheck)
                    }
                    
                })
                
                
                
                
                
                
        } .onAppear() {
                
                if (self.locationManager.location == nil){
                    
                    self.locationServices = false
                }
                else {
                    self.locationServices = true
                }
                
                var _: [FishCheckpoint] = []
                var coor:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 0, longitude: 0)
                var curCheck:FishCheckpoint = FishCheckpoint(title: "First", subtitle: "First", coordinate: coor, color: "Blue", size: "huge")
                
                
                let curcoor = self.locationManager.location != nil ?
                    self.locationManager.location!.coordinate :
                    CLLocationCoordinate2D()
                
                
                
                
                ServerUtils.getFish(latitude: curcoor.latitude, longitude: curcoor.longitude, date: self.date, location: self.location, size: self.size, type: self.type, returnWith:  { response in
                    self.checkpoints.removeAll()
                    let fishSet:DataSet = response
                    
                    
                    _ = self.checkpoints.count
                    
                    
                    _ = fishSet.fish.count
                    var curFish:SingleFish
                    
                    for fish in fishSet.fish {
                        
                        curFish = fish
                        coor.latitude = curFish.latitude
                        coor.longitude = curFish.longitude
                        
                        let formatter = DateFormatter()
                        formatter.dateStyle = .short
                        let myNSDate = Date(timeIntervalSince1970: curFish.date)
                        let todaysDate:String = formatter.string(from: myNSDate)
                        
                        
                        curCheck = FishCheckpoint(title: curFish.type, subtitle: todaysDate, coordinate: coor, color: curFish.color, size: curFish.size)
                        
                        if (curFish.type != "fake"){
                            self.checkpoints.append(curCheck)
                        }
                        
                    }
                    
                    
                })
                
                
                
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

