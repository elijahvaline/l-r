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
    @State var labeler:String = "Hello There"
    @State private var showPopUp = false
    
    
    var screenWidth  = UIScreen.main.bounds.width
    var screenHeight = UIScreen.main.bounds.height
    
    @ObservedObject private var locationManager = LocationManager()
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    
    
    var fish = ["Trout", "Walleye", "Sunny", "Croppie"]
    @State private var selectedFish = 0
    
    var size = ["Big", "Bigger", "Biggest"]
    @State private var selectedSize = 0
    
    var body: some View {
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.backButtonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        let onBlue = Binding<Bool>(get: { self.blue }, set: { self.blue = $0; self.red = false; self.purple = false; self.yellow = false; self.green = false })
        let onRed = Binding<Bool>(get: { self.red}, set: { self.blue = false; self.red = $0; self.purple = false; self.yellow = false; self.green = false })
        let onPurple = Binding<Bool>(get: { self.purple }, set: { self.blue = false; self.red = false; self.purple = $0; self.yellow = false; self.green = false })
        let onYellow = Binding<Bool>(get: { self.yellow }, set: { self.blue = false; self.red = false; self.purple = false; self.yellow = $0; self.green = false })
        let onGreen = Binding<Bool>(get: { self.green }, set: { self.blue = false; self.red = false; self.purple = false; self.yellow = false; self.green = $0 })
        
        
        let big1 = Binding<Bool>(get: { self.big }, set: { self.big = $0; self.bigger = false; self.huge = false})
        let big2 = Binding<Bool>(get: { self.bigger }, set: { self.big = false; self.bigger = $0; self.huge = false})
        let big3 = Binding<Bool>(get: { self.huge }, set: { self.big = false; self.bigger = false; self.huge = $0})
        
        //                return ScrollView {
        
        //        return NavigationView{
        
        return ZStack{
            

            VStack(alignment: .center, spacing: 20.0){
                
                
                
                
                //            ZStack{
                //
                //                Rectangle()
                //                    .foregroundColor(.blue)
                //                    .frame(width: screenWidth, height: 100)
                //
                //                Text("New Fish")
                //                    .foregroundColor(.white)
                //                    .font(.title)
                //                    .padding(.top, 40.0)
                //
                //            }
                
                
                ZStack{
                    
                    RoundedRectangle(cornerRadius: 50)
                        .stroke(Color(UIColor.systemGray6), lineWidth: 2)
                        
                        .padding(.horizontal, 0.0)
                        
                        
                        
                        .frame(width: screenWidth-25)
                        .foregroundColor(Color(UIColor.systemBackground))
                        .shadow(color: Color.black.opacity(0.2), radius: 7, x: 0, y: 2)
                    
                    
                    
                    HStack(){
                        
                        Toggle(isOn: onBlue) {
                            Text("")
                        }
                        .frame(width: -140.0, height: 0.0)
                        .labelsHidden()
                        .padding(.horizontal, 100)
                        .toggleStyle(CheckboxToggleStyle())
                        .foregroundColor(.init(red: 255/255, green: 166/255, blue: 85/255))
                        
                        
                        Toggle(isOn: onPurple) {
                            Text("")
                        }
                        .frame(width: -140.0, height: 0.0)
                        .labelsHidden()
                        .padding(.horizontal, 100)
                        .toggleStyle(CheckboxToggleStyle())
                        .foregroundColor(.init(red: 243/255, green: 71/255, blue: 105/255))
                        
                        Toggle(isOn: onRed) {
                            Text("")
                        }
                        .frame(width: -140.0, height: 0.0)
                        .labelsHidden()
                        .padding(.horizontal, 100)
                        .toggleStyle(CheckboxToggleStyle())
                        .foregroundColor(.init(red: 255/255, green: 118/255, blue: 186/255))
                        
                        Toggle(isOn: onYellow) {
                            Text("")
                        }
                        .frame(width: -140.0, height: 0.0)
                        .labelsHidden()
                        .padding(.horizontal, 100)
                        .toggleStyle(CheckboxToggleStyle())
                        .foregroundColor(.init(red: 185/255, green: 108/255, blue: 254/255))
                        
                        
                        
                        
                        Toggle(isOn: onGreen) {
                            Text("")
                        }
                        .frame(width: -140.0, height: 0.0)
                        .labelsHidden()
                        .padding(.horizontal, 100)
                        .toggleStyle(CheckboxToggleStyle())
                        .foregroundColor(.init(red: 50/255, green: 134/255, blue: 254/255))
                        
                        
                        
                    }
                    
                    
                }.frame(width: screenWidth - 25, height: 100.0)
                
                ZStack{
                    
                    RoundedRectangle(cornerRadius: 50)
                        .stroke(Color(UIColor.systemGray6), lineWidth: 2)
                        .frame(width: 375.0, height: 163)
                        .foregroundColor(Color(UIColor.systemGray6))
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
                
                
                ZStack{
                    
                    RoundedRectangle(cornerRadius: 50)
                        .stroke(Color(UIColor.systemGray6), lineWidth: 2)
                        .frame(width: 375.0, height: 200)
                        .foregroundColor(Color(UIColor.systemGray6))
                        .shadow(color: Color.black.opacity(0.2), radius: 7, x: 0, y: 2)
                    
                    
                    Picker(selection: $selectedFish, label: Text("")) {
                        ForEach(0 ..< fish.count) {
                            Text(self.fish[$0])
                        }
                    }.foregroundColor(.blue)
                        .labelsHidden()
                        .frame(width: 200.0, height: 200.0)
                    
                    
                    
                    
                }.padding(.vertical).frame(width: 420.0, height: 200.0)
                
                
                
                HStack(spacing: 30){
                    
                    //Add Fish
                    Button(action: {
                        
                        
                        let coor = self.locationManager.location != nil ?
                            self.locationManager.location!.coordinate :
                            CLLocationCoordinate2D()
                        var color:String = "blue"
                        var size:String = "Big"
                        
                        let local = CLLocation(latitude: coor.latitude, longitude: coor.longitude)
                        let geo = CLGeocoder()
                        
                        if (self.blue == true){
                            color = "blue"
                            
                        }
                        else if (self.red == true){
                            color = "red"
                            
                        }
                        else if (self.purple == true){
                            color = "purple"
                        }
                        else if (self.yellow == true){
                            color = "orange"
                        }
                        else if (self.green == true){
                            color = "green"
                        }
                        else {
                            color = "blue"
                        }
                        
                        if (self.big == true){
                            size = "big"
                        }
                        else if (self.bigger == true){
                            size = "bigger"
                        }
                        else if (self.huge == true){
                            size = "huge"
                        }
                        else{
                            size = "big"
                        }
                        
                        GeocodeManager.getLocation(Longitude: coor.longitude, Latitude: coor.latitude, returnWith: { response in
                            self.labeler = response.inlandWater ?? "null"
                            
                            
                            if (self.labeler == "change this") {
                                
                                self.showPopUp = true
                            }
                            else{
                                ServerUtils.addFish(fishLatitude: coor.latitude, fishLongitude: coor.longitude, fishType: self.fish[self.selectedFish], fishSize: size, fishColor: color)
                                
                                                 
                                
                                print(self.labeler)
                                self.presentationMode.wrappedValue.dismiss()
                                
                            }
                        })
                        
                        
                        
                        
                        
                        
                        
                    }) {
                        
                        ZStack{
                            
                            
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.blue)
                                .font(.system(size: 50))
                            
                            
                        }
                    }
                }
                
            }
                //        .edgesIgnoringSafeArea(.all)
                //            .statusBar(hidden: true)
                //            .padding(.top, 0.)
                //            .navigationBarBackButtonHidden(true)
                .navigationBarTitle(Text("New Fish").foregroundColor(.blue))
                .frame(minWidth: 0,
                       maxWidth: .infinity,
                       minHeight: 0,
                       maxHeight: .infinity,
                       alignment: .topLeading)
            
            
            //            }
            
            
          
            
            if $showPopUp.wrappedValue {
                ZStack {
                    Color.white
                    VStack {
                        Text("Ope! Looks like you're on land")
                        Spacer()
                        Button(action: {
                            self.showPopUp = false
                        }, label: {
                            Text("Close")
                        })
                    }.padding()
                }
                .frame(width: 300, height: 200)
                .cornerRadius(20).shadow(radius: 20)
            }
            
            
            
            
            
        }
        
    }
    
}


class GeocodeManager {
    
    static func getLocation(Longitude: Double, Latitude: Double, returnWith: @escaping (CLPlacemark)->()) {
        var locationManager = LocationManager()
        var geocoder = CLGeocoder()
        let coor = locationManager.location != nil ?
            locationManager.location!.coordinate :
            CLLocationCoordinate2D()
        
        
       
        
        geocoder.reverseGeocodeLocation(CLLocation(latitude: Latitude, longitude: Longitude), completionHandler: {(placemarks, error)->Void in
            var placemark:CLPlacemark!
            
            if error == nil && placemarks!.count > 0 {
                placemark = placemarks![0] as CLPlacemark
                returnWith(placemark)
                
            }
            
            
        })
    }
}

struct NewFishView_Previews: PreviewProvider {
    static var previews: some View {
        NewFishView()
    }
}
