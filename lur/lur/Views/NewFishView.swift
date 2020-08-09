//
//  NewFishView.swift
//  lur
//
//  Created by Elijah Valine on 7/27/20.
//  Copyright © 2020 Elijah Valine. All rights reserved.
//

import SwiftUI
import CoreLocation

extension AnyTransition {
    static var moveAndFade: AnyTransition {
        AnyTransition.slide
    }
}

extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}

struct CheckboxToggleStyle: ToggleStyle {
    let scaleFactor:Float = 0.12
    
    
    func makeBody(configuration: Configuration) -> some View {
        var sizie = Int(UIScreen.screenWidth * 0.12)
            configuration.label
            return Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle.fill")
                
                .font(.system(size:CGFloat(sizie)))
                .onTapGesture { configuration.isOn.toggle() }
            }
}


class Calculator {
   
    static func circleSpacing(width:CGFloat) -> CGFloat {
        var x = width * 0.12
        var y = width - 25
        var z = y - (x * 5)
        return z/6
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
    @State var message = "Ope! It looks like you have location services turned off"
    
    @Binding var checkpoints: [FishCheckpoint]
    @Binding var location:String
    @Binding var date:String
    @Binding var sizie:String
    @Binding var type:String
    
    @State var angle = 0.0
    
    @State private var showDetail = false
    @State private var agreedToTerms = false
    
    let screenSize: CGRect = UIScreen.main.bounds
    @State var spacing = 20.0
    
    var screenWidth  = UIScreen.main.bounds.width
    var screenHeight = UIScreen.main.bounds.height
    
    
    @ObservedObject private var locationManager = LocationManager()
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    
    
    var fish = ["Atlantic Salmon","Bluefish","Blue Catfish","Bluegill","Brook Trout","Brown Trout","Carp","Chain Pickerel","Channel Catfish","Chinook Salmon","Coho Salmon","Crappie","Cutthroat Trout","Flathead Catfish","King Salmon","Lake Trout","Largemouth Bass","Muskellunge","Northern Pike","Pacific Halibut","Pink Salmon", "Redfish", "Rainbow Trout", "Redear Sunfish","Stripped Bass","Sauger", "Smallmouth Bass","Striped Bass","Sturgeon","Walleye","White Bass","Yellow Perch"]
    @State private var selectedFish = 0
    
    var size = ["Big", "Bigger", "Biggest"]
    @State private var selectedSize = 0
    
    var body: some View {
        
    
        
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
       
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
        
        
        
        return ScrollView{
           
            
//            VStack(alignment: .center, spacing: CGFloat(self.spacing)){
                

                
                
                ZStack{
                    
                                        RoundedRectangle(cornerRadius: 50)
                                            
                                        
                                            .stroke(Color(UIColor.systemGray6), lineWidth: 2)
                    //                        .frame(width:screenWidth-25)
                                        
                                            .frame(width: screenWidth - 25, height: screenWidth*0.12 + (Calculator.circleSpacing(width: screenWidth)*2), alignment: .trailing)
                                            .foregroundColor(Color(UIColor.systemBackground))
                                            .shadow(color: Color.black.opacity(0.2), radius: 7, x: 0, y: 2)
                    
                    
                    HStack(spacing: Calculator.circleSpacing(width: screenWidth)) {

                                            Toggle(isOn: onPurple) {
                                                Text("")
                                            }
                                            .frame(width: screenWidth * 0.12, height: screenWidth * 0.12)
                                            .labelsHidden()
                                            .toggleStyle(CheckboxToggleStyle())
                                            .foregroundColor(.init(red: 255/255, green: 166/255, blue: 85/255))


                                            Toggle(isOn: onBlue) {
                                                Text("")
                                            }

                                            .labelsHidden()
                                            .toggleStyle(CheckboxToggleStyle())
                                            .foregroundColor(.init(red: 243/255, green: 71/255, blue: 105/255))
                    //
                                            Toggle(isOn: onGreen) {
                                                Text("")
                                            }

                                            .labelsHidden()
                                            .toggleStyle(CheckboxToggleStyle())
                                            .foregroundColor(.init(red: 255/255, green: 118/255, blue: 186/255))
                    //
                                            Toggle(isOn: onYellow) {
                                                Text("")
                                            }
                                            .labelsHidden()
                                            .toggleStyle(CheckboxToggleStyle())
                                            .foregroundColor(.init(red: 185/255, green: 108/255, blue: 254/255))
                    //
                    //
                    //
                    //
                                            Toggle(isOn: onRed) {
                                                Text("")
                                            }
                                            .labelsHidden()
                                            .toggleStyle(CheckboxToggleStyle())
                                            .foregroundColor(.init(red: 50/255, green: 134/255, blue: 254/255))



                                        }
                    //
                                        
                                    }
                .padding(.top, 20)
            
                ZStack{
                    
                    RoundedRectangle(cornerRadius: 50)
                    .stroke(Color(UIColor.systemGray6), lineWidth: 2)
                    .frame(width: screenWidth-25, height: screenWidth*0.22 + 60)
                    .foregroundColor(Color(UIColor.systemGray6))
                    .shadow(color: Color.black.opacity(0.2), radius: 7, x: 0, y: 2)
                    
                    HStack(spacing: 0){
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
                }
                .padding(.top, 20.0)
                
                
                ZStack{
                    
                    RoundedRectangle(cornerRadius: 50)
                    .stroke(Color(UIColor.systemGray6), lineWidth: 2)
                    .frame(width: screenWidth-25, height: 200)
                    .foregroundColor(Color(UIColor.systemGray6))
                    .shadow(color: Color.black.opacity(0.2), radius: 7, x: 0, y: 2)
                    
                    
                    Picker(selection: $selectedFish, label: Text("")) {
                           ForEach(0 ..< fish.count) {
                               Text(self.fish[$0]).tag(self.fish[$0].replacingOccurrences(of: " ", with: "-"))
                           }
                       }.foregroundColor(.blue)
                           .labelsHidden()
                           .frame(width: screenWidth-50, height: 200.0)
                }
                .padding(.top, 20.0)
                    
                    
                
                
                HStack(spacing: 30){
                    
                    //Add Fish
                    Button(action: {
                        
                        
                        withAnimation(.easeInOut(duration: 2)) {
                            print("Hello")
                            let coor = self.locationManager.location != nil ?
                                self.locationManager.location!.coordinate :
                                CLLocationCoordinate2D()
                            var color:String = "blue"
                            var size:String = "Big"
                            self.angle += 180.0
                            self.showDetail = true
//                            self.showDetail = false
                            
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
                                
                                
                                if (self.labeler == "nill") {
                                    self.message = "Ope! It looks like you're too far inland"
                                    self.showPopUp = true
                                }
                                else{
                                    self.agreedToTerms = true
                                    
                                    ServerUtils.addFish(fishLatitude: coor.latitude, fishLongitude: coor.longitude, fishType: self.fish[self.selectedFish], fishSize: size, fishColor: color)
                                    
                                    
                                    
                                    print(self.labeler)
                                    
                                    var _: [FishCheckpoint] = []
                                    var coor:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 0, longitude: 0)
                                    var curCheck:FishCheckpoint = FishCheckpoint(title: "First", subtitle: "First", coordinate: coor, color: "Blue", size: "huge")
                                    
                                    
                                    let curcoor = self.locationManager.location != nil ?
                                        self.locationManager.location!.coordinate :
                                        CLLocationCoordinate2D()
                                    
                                    
                                    
                                    
                                    ServerUtils.getFish(latitude: curcoor.latitude, longitude: curcoor.longitude, date: self.date, location: self.location, size: self.sizie, type: self.type, returnWith:  { response in
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
                                    
                                    let seconds = 0.5
                                                                 
                                                         DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                                                            self.presentationMode.wrappedValue.dismiss()
                                                         }
                                    
                                }
                            })
                            
                            
                            
                            
                        }
                        
                        
                    }) {
                        
                        ZStack{
                            
                            
                            Image(systemName: "plus.circle.fill")
                                
                                
                                .foregroundColor(.blue)
                                .font(.system(size: 50))
//                                .rotationEffect(.degrees(showDetail ? 180 : 0))
                                .rotationEffect(.degrees(self.angle))
                                .padding(.top, 10)
                                .animation(.easeInOut)
                            
                            
                            
                        }
                        .padding(.top, 10.0)
                        
                    }.disabled(agreedToTerms)
                    
                }
//                .padding(20.0)
                
                if $showPopUp.wrappedValue {
                    HStack{
                        Image(systemName: "exclamationmark.circle.fill")
                            .foregroundColor(.red)
                            .font(.system(size: 30))
                        
                        Text(self.message)
                    }
                    .padding(.top, 10)
                    .padding(.bottom, 20.0)
                    
                }
                
                
                

//            }.navigationBarTitle(Text("New Fish").foregroundColor(.blue))
        }.navigationBarTitle(Text("New Fish"), displayMode: .inline)
        .navigationBarItems(trailing:
        Button("Privacy") {
            
            let original = "https://lür.com/privacy"
            if let encoded = original.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed){
               let url = URL(string: encoded)
                UIApplication.shared.open(url!)
                
            }

                
        })

                //        .edgesIgnoringSafeArea(.all)
                //            .statusBar(hidden: true)
                //            .padding(.top, 0.)
                //            .navigationBarBackButtonHidden(true)
                
//                .frame(minWidth: 0,
//                       maxWidth: .infinity,
//                       minHeight: 0,
//                       maxHeight: .infinity,
//                       alignment: .top)
            
            
            //            }
            
            
        }
        
//    }
    
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

//struct NewFishView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewFishView()
//    }
//}

