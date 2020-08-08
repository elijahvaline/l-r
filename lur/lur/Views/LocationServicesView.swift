//
//  LocationServicesView.swift
//  lur
//
//  Created by Elijah Valine on 8/7/20.
//  Copyright © 2020 Elijah Valine. All rights reserved.
//

import SwiftUI
import CoreLocation


struct LocationServicesView: View {
    @ObservedObject private var locationManager = LocationManager()
    @Binding var locationServices:Bool
    let timer2 = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        return ZStack{
            
            Color.blue
                           .edgesIgnoringSafeArea(.all)
            
            VStack{
                ZStack{
                    Image(systemName: "questionmark")
                        .foregroundColor(.white)
                        .padding(.bottom, 400)
                        .padding(.trailing, 200)
                        .font(.system(size: 80))
                                                
                    
                    Image("fishy.stare")
                                   .foregroundColor(.white)
                                       .padding(.leading, 85.0)
                                       .padding(.bottom, 250.0)
                                   .font(.system(size: 200))
                    
                }
               
                
                HStack{
                    Image(systemName: "exclamationmark.circle.fill")
                        .foregroundColor(.red)
                        .font(.system(size: 30))
                    
                    Text("Please enable location services")
                    .foregroundColor(.white)
                        .bold()
                        .font(.system(size: 20))
                        
                    
                }
                Text("System Preferences > lür > Location")
                .foregroundColor(.white)
               
                
            }
            .onReceive(timer2) { time in
                           
                           if (self.locationManager.location == nil){
                                                            
                                                            self.locationServices = false
                                                        }
                                                        else {
                                                            self.locationServices = true
                                                        }
               
                   }
            
        }
        
        
        
            
    }
    

}
