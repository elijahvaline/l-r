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
        return VStack(spacing: 20.0){
            
            
            
            
            ZStack{
                
                Rectangle()
                    .foregroundColor(.blue)
                    .frame(width: screenWidth, height: 100)
                
                Text("New Fish")
                    .foregroundColor(.white)
                    .font(.title)
                    .padding(.top, 40.0)
                
            }
            
            
            
            
            ZStack{
                
                RoundedRectangle(cornerRadius: 50)
                    .padding(.horizontal, 0.0)
                    
                    
                    .frame(width: screenWidth-25)
                    .foregroundColor(.white)
                    .shadow(color: Color.black.opacity(0.2), radius: 7, x: 0, y: 2)
                
                
                HStack(){
                    
                    Toggle(isOn: onRed) {
                        Text("")
                    }
                    .frame(width: -140.0, height: 0.0)
                    .labelsHidden()
                    .padding(.horizontal, 100)
                    .toggleStyle(CheckboxToggleStyle())
                    .foregroundColor(.init(red: 222/255, green: 64/255, blue: 99/255))
                    
                    Toggle(isOn: onYellow) {
                        Text("")
                    }
                    .frame(width: -140.0, height: 0.0)
                    .labelsHidden()
                    .padding(.horizontal, 100)
                    .toggleStyle(CheckboxToggleStyle())
                    .foregroundColor(.init(red: 230/255, green: 149/255, blue: 74/255))
                    
                    Toggle(isOn: onGreen) {
                        Text("")
                    }
                    .frame(width: -140.0, height: 0.0)
                    .labelsHidden()
                    .padding(.horizontal, 100)
                    .toggleStyle(CheckboxToggleStyle())
                    .foregroundColor(.init(red: 111/255, green: 208/255, blue: 95/255))
                    
                    Toggle(isOn: onBlue) {
                        Text("")
                    }
                    .frame(width: -140.0, height: 0.0)
                    .labelsHidden()
                    .padding(.horizontal, 100)
                    .toggleStyle(CheckboxToggleStyle())
                    .foregroundColor(.init(red: 50/255, green: 133/255, blue: 254/255))
                    
                    
                    Toggle(isOn: onPurple) {
                        Text("")
                    }
                    .frame(width: -140.0, height: 0.0)
                    .labelsHidden()
                    .padding(.horizontal, 100)
                    .toggleStyle(CheckboxToggleStyle())
                    .foregroundColor(.init(red: 146/255, green: 91/255, blue: 200/255))
                    
                    
                    
                    
                }
                
                
            }.frame(width: screenWidth - 25, height: 100.0)
            
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
                    var completion = CLPlacemark()
                    
                    geo.reverseGeocodeLocation(local) { placemarks, error in
                        
                        guard error == nil else {
                            print("*** Error in \(#function): \(error!.localizedDescription)")
                            return
                        }
                        
                        guard let placemark = placemarks?[0] else {
                            print("*** Error in \(#function): placemark is nil")
                            return
                        }
                        
                        completion = placemark
                    }
                    
                    
                    
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
                    
                    //                print(self.fish[self.selectedFish])
                    //                print(size)
                    //                print(color)
                    
                    ServerUtils.addFish(fishLatitude: coor.latitude, fishLongitude: coor.longitude, fishType: self.fish[self.selectedFish], fishSize: size, fishColor: color)
                    
                    
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 50)
                            .frame(width: 200.0, height: 75.0)
                            .foregroundColor(.blue)
                        
                        Text("Add Fish")
                            .font(.largeTitle)
                            
                            .foregroundColor(.white)
                        
                    }
                }
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 50)
                            .frame(width: 75.0, height: 75.0)
                            .foregroundColor(.blue)
                        
                        Image(systemName: "trash")
                            .foregroundColor(.white)
                            .font(.system(size: 35))
                        
                    }
                }
            }
            
            
            
            
            
            
            
            
            
            
        }.edgesIgnoringSafeArea(.all)
            .statusBar(hidden: true)
            .padding(.top, 0.0
                
        )
            .navigationBarBackButtonHidden(true)
        
        //            }
    }
    
}

struct NewFishView_Previews: PreviewProvider {
    static var previews: some View {
        NewFishView()
    }
}
