//
//  FilterView.swift
//  lur
//
//  Created by Elijah Valine on 8/4/20.
//  Copyright © 2020 Elijah Valine. All rights reserved.
//

import SwiftUI
import CoreLocation


struct FilterView: View {
    
    
    //
    @Binding var location:String
    @Binding var date:String
    @Binding var size:String
    @Binding var type:String
   
    
    let screenSize: CGRect = UIScreen.main.bounds
     @ObservedObject private var locationManager = LocationManager()
    
    @State private var favoriteColor = 0
    
    var fish = ["All","Atlantic Salmon","Bluefish","Blue Catfish","Bluegill","Brook Trout","Brown Trout","Carp","Chain Pickerel","Channel Catfish","Chinook Salmon","Coho Salmon","Crappie","Cutthroat Trout","Flathead Catfish","King Salmon","Lake Trout","Largemouth Bass","Muskellunge","Northern Pike","Pacific Halibut","Pink Salmon", "Redfish", "Rainbow Trout", "Redear Sunfish","Stripped Bass","Sauger", "Smallmouth Bass","Striped Bass","Sturgeon","Walleye","White Bass","Yellow Perch"]
    
    
    
    var body: some View {
        
        
                let screenWidth = screenSize.width
                let screenHeight = screenSize.height
                 
                return ScrollView{
                    
                
//                  VStack(spacing: 20) {
                     
//                     Divider()
//                        .frame(width: screenWidth - 25, alignment: .center)
//                        .padding(.top, 20)
                    
                        
                     
                     VStack(alignment: .center, spacing: 20) {

                         Text("Location")
                             .bold()
                             .foregroundColor(.blue)

                         Picker(selection: $location, label: Text("What is your favorite color?")) {
                             Text("Local").tag("local")
                             Text("Global").tag("all")
                            
                            
                            

                         }.pickerStyle(SegmentedPickerStyle())

                     }.frame(width: screenWidth - 25)
                    .padding(.top, 20)
                     
                     Divider()
                    .frame(width: screenWidth - 25)
                    .padding(.top, 20)

                     VStack(alignment: .center, spacing: 20) {

                         Text("Size")
                             .bold()
                             .foregroundColor(.blue)

                         Picker(selection: $size , label: Text("What is your favorite color?")) {
                             Text("Small").tag("small")
                             Text("Medium").tag("medium")
                             Text("Large").tag("large")
                             Text("All").tag("all")

                         }.pickerStyle(SegmentedPickerStyle())

                     }.frame(width: screenWidth - 25)
                    .padding(.top, 10)
                        
        //
                     Divider()
                    .frame(width: screenWidth - 25)
                    .padding(.top, 20)

                     VStack(alignment: .center, spacing: 20) {

                         Text("Date")
                             .bold()
                             .foregroundColor(.blue)

                         Picker(selection: $date , label: Text("What is your favorite color?")) {
                             Text("Recent").tag("recent")
                             Text("This Year").tag("year")
                             Text("All Time").tag("all")


                         }.pickerStyle(SegmentedPickerStyle())

                     }.frame(width: screenWidth - 25)
                    .padding(.top, 20)
                     
                     Divider()
                    .frame(width: screenWidth - 25)
                    .padding(.top, 20)

                     Text("Type")
                         .bold()
                         .foregroundColor(.blue)


                     ZStack{
                         RoundedRectangle(cornerRadius: 50)
                             .stroke(Color(UIColor.systemGray6), lineWidth: 2)
                             .frame(width: screenWidth - 25, height: 200)
                             .foregroundColor(Color(UIColor.systemGray6))


                         Picker(selection: $type, label: Text("")) {
                             ForEach(0 ..< fish.count) {
                                
                                Text(self.fish[$0]).tag(self.fish[$0].replacingOccurrences(of: " ", with: "-"))

                             }

                         }


                         .foregroundColor(.blue)
                         .labelsHidden()

                     }.frame(width: screenWidth - 25)
                    .padding(.top, 20)
                    
                    Divider()
                               .frame(width: screenWidth - 25)
                    .padding(.top, 20)

                 }.navigationBarTitle("Filter", displayMode: .inline)
        //             .padding(.horizontal)
                     .frame(minWidth: 0,
                            maxWidth: .infinity,
                            minHeight: 0,
                            maxHeight: .infinity,
                            alignment: .top)
                 
                 
                }
    
    
//    }
    
    
    
}



//struct FilterView_Previews: PreviewProvider {
//    static var previews: some View {
//        FilterView()
//    }
//}

