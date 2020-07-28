//
//  NewFishView.swift
//  lur
//
//  Created by Elijah Valine on 7/27/20.
//  Copyright © 2020 Elijah Valine. All rights reserved.
//

import SwiftUI
import CoreLocation

struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        return HStack {
            configuration.label
            Spacer()
            Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle.fill")
                .resizable()
                .frame(width: 50.0, height: 50.0)
                .onTapGesture { configuration.isOn.toggle() }
        }.frame(width: 50.0, height: 50.0)
    }
}

struct FishyToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        return HStack {
            configuration.label
            Spacer()
            Image(configuration.isOn ? "SizeSelected" : "SizeSelect")
                .resizable()
                
                .onTapGesture { configuration.isOn.toggle() }
        }.frame(width: 160.0, height: 155.0)
    }
}
struct MediumFishyToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        return HStack {
            configuration.label
            Spacer()
            Image(configuration.isOn ? "SizeSelected" : "SizeSelect")
            .resizable()
                
                .padding(0.0)
                .onTapGesture { configuration.isOn.toggle() }
        }.frame(width: 135.0, height: 130.0)
    }
}
struct SmallFishyToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        return HStack {
            configuration.label
            Spacer()
            Image(configuration.isOn ? "SizeSelected" : "SizeSelect")
            .resizable()
                
                .onTapGesture { configuration.isOn.toggle() }
        }.frame(width: 110.0, height: 105.0)
    }
}

struct NewFishView: View {
    
    @State var blue:Bool = false
    @State var red:Bool = false
    @State var purple:Bool = false
    @State var yellow:Bool = false
    @State var green:Bool = false
    
    @State var big = false
    @State var bigger = false
    @State var huge = false
    
    @ObservedObject private var locationManager = LocationManager()
    
    var fish = ["Trout", "Walleye", "Sunny", "Croppie"]
    @State private var selectedFish = 0
    
    var size = ["Big", "Bigger", "Biggest"]
    @State private var selectedSize = 0
    
    var body: some View {
        
        let on1 = Binding<Bool>(get: { self.blue }, set: { self.blue = $0; self.red = false; self.purple = false; self.yellow = false; self.green = false })
        let on2 = Binding<Bool>(get: { self.red}, set: { self.blue = false; self.red = $0; self.purple = false; self.yellow = false; self.green = false })
        let on3 = Binding<Bool>(get: { self.purple }, set: { self.blue = false; self.red = false; self.purple = $0; self.yellow = false; self.green = false })
        let on4 = Binding<Bool>(get: { self.yellow }, set: { self.blue = false; self.red = false; self.purple = false; self.yellow = $0; self.green = false })
        let on5 = Binding<Bool>(get: { self.green }, set: { self.blue = false; self.red = false; self.purple = false; self.yellow = false; self.green = $0 })
        
        
        let big1 = Binding<Bool>(get: { self.big }, set: { self.big = $0; self.bigger = false; self.huge = false})
        let big2 = Binding<Bool>(get: { self.bigger }, set: { self.big = false; self.bigger = $0; self.huge = false})
        let big3 = Binding<Bool>(get: { self.huge }, set: { self.big = false; self.bigger = false; self.huge = $0})
        
        //        return ScrollView {
        return VStack(spacing: 20.0){
            
//            ZStack{
//                RoundedRectangle(cornerRadius: 50)
//                    .frame(width: 200.0, height: 75.0)
//                    .foregroundColor(.blue)
//
//                Text("Add Fish")
//                .font(.largeTitle)
//
//                    .foregroundColor(.white)
//
//
//            }
//            .padding(.top, 50.0)
            
                
                
                
            
            
            ZStack{
                
                RoundedRectangle(cornerRadius: 50)
                    .padding(.horizontal, 25.0)
                    
                    
                    .frame(width: 420.0)
                    .foregroundColor(.white)
                    .shadow(color: Color.black.opacity(0.2), radius: 7, x: 0, y: 2)
                
                
                HStack{
                    
                    Toggle(isOn: on1) {
                        Text("")
                    }
                    .frame(width: -140.0, height: 0.0)
                    .labelsHidden()
                    .padding(.horizontal, 100.0)
                    .toggleStyle(CheckboxToggleStyle())
                    .foregroundColor(.blue)
                    
                    Toggle(isOn: on2) {
                        Text("")
                    }
                    .frame(width: -140.0, height: 0.0)
                    .labelsHidden()
                    .padding(.horizontal, 100.0)
                    .toggleStyle(CheckboxToggleStyle())
                    .foregroundColor(.red)
                    
                    Toggle(isOn: on3) {
                        Text("")
                    }
                    .frame(width: -140.0, height: 0.0)
                    .labelsHidden()
                    .padding(.horizontal, 100.0)
                    .toggleStyle(CheckboxToggleStyle())
                    .foregroundColor(.purple)
                    
                    Toggle(isOn: on4) {
                        Text("")
                    }
                    .frame(width: -140.0, height: 0.0)
                    .labelsHidden()
                    .padding(.horizontal, 100.0)
                    .toggleStyle(CheckboxToggleStyle())
                    .foregroundColor(.yellow)
                    
                    Toggle(isOn: on5) {
                        Text("")
                    }
                    .frame(width: -140.0, height: 0.0)
                    .labelsHidden()
                    .padding(.horizontal, 100.0)
                    .toggleStyle(CheckboxToggleStyle())
                    .foregroundColor(.green)
                }
                
                
            }.frame(width: 420.0, height: 100.0)
            
            ZStack{
                
                RoundedRectangle(cornerRadius: 50)
                    .frame(width: 375.0, height: 163)
                    .foregroundColor(.white)
                    .shadow(color: Color.black.opacity(0.2), radius: 7, x: 0, y: 2)
                
                HStack(spacing:-15){
                    Toggle(isOn: big1) {
                        Text("")
                    }
                    .toggleStyle(SmallFishyToggleStyle())
                    
                    Toggle(isOn: big2) {
                        Text("")
                    }
                    
                    .toggleStyle(MediumFishyToggleStyle())
                    
                    Toggle(isOn: big3) {
                        Text("")
                    }
                    .toggleStyle(FishyToggleStyle())
                }
                .padding(.trailing, 8.0)
                
                
                
                
                
                
                
                
                
                
            }.padding(.vertical).frame(width: 420.0, height: 180.0)
            
            //            ZStack{
            //
            //                RoundedRectangle(cornerRadius: 50)
            //                    .frame(width: 375.0, height: 200.0)
            //                    .foregroundColor(.white)
            //                    .shadow(color: Color.black.opacity(0.2), radius: 7, x: 0, y: 2)
            //
            //                Picker(selection: $selectedSize, label: Text("")) {
            //                    ForEach(0 ..< size.count) {
            //                        Text(self.size[$0])
            //                    }
            //                }.foregroundColor(.blue)
            //                    .labelsHidden()
            //
            //                    .frame(width: 200.0, height: 200.0)
            //            }.padding(.bottom).frame(width: 420.0, height: 220.0)
            
            
            ZStack{
                
                RoundedRectangle(cornerRadius: 50)
                    .frame(width: 375.0, height: 200)
                    .foregroundColor(.white)
                    .shadow(color: Color.black.opacity(0.2), radius: 7, x: 0, y: 2)
                
                
                Picker(selection: $selectedFish, label: Text("")) {
                    ForEach(0 ..< fish.count) {
                        Text(self.fish[$0])
                    }
                }.foregroundColor(.blue)
                    .labelsHidden()
                    .frame(width: 200.0, height: 200.0)
                
                
                
                
            }.padding(.vertical).frame(width: 420.0, height: 200.0)
            
            //            ZStack{
            //
            //                RoundedRectangle(cornerRadius: 50)
            //                    .padding()
            //                    .frame(width: 375.0, height: 220.0)
            //                    .foregroundColor(.white)
            //                    .shadow(color: Color.black.opacity(0.2), radius: 7, x: 0, y: 2)
            //
            //                            Picker(selection: $selectedFish, label: Text("")) {
            //                                ForEach(0 ..< fish.count) {
            //                                    Text(self.fish[$0])
            //                                }
            //                            }.foregroundColor(.blue)
            //                                .labelsHidden()
            //                                .frame(width: 200.0, height: 200.0)
            //
            //
            //
            //            }.frame(width: 375.0, height: 200.0)
            
            
            
            Button(action: {
                
                
                
                
                let coordinate = self.locationManager.location != nil ?
                    self.locationManager.location!.coordinate :
                    CLLocationCoordinate2D()
                print(self.size[self.selectedSize])
                print(self.fish[self.selectedFish])
                //                    ServerUtils.addFish(fishLatitude: coordinate.latitude, fishLongitude: coordinate.longitude, fishType: 1, fishSize: 1)
                print("ok")
                
                print("Added")
            }) {
                
                ZStack{
                RoundedRectangle(cornerRadius: 50)
                                    .frame(width: 200.0, height: 75.0)
                                    .foregroundColor(.blue)
                
                                Text("Add Fish")
                                .font(.largeTitle)
                
                                    .foregroundColor(.white)
                    
                }
//                Image(systemName: "plus")
//                    .font(.title)
//
//
//                    .padding()
//                    .foregroundColor(.white)
//                    .background(Color.blue)
//                    .cornerRadius(40)
            }
            
        }
        .padding(.top, -175.0)
        
        //    }
    }
    
}

struct NewFishView_Previews: PreviewProvider {
    static var previews: some View {
        NewFishView()
    }
}
