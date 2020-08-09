//
//  TestView2.swift
//  lur
//
//  Created by Elijah Valine on 8/8/20.
//  Copyright © 2020 Elijah Valine. All rights reserved.
//

import SwiftUI

struct TestView2: View {
       //
     @State public var location = "all"
     @State public var date = "all"
     @State public var size = "all"
     @State public var type = "All"
     
    let screenSize: CGRect = UIScreen.main.bounds
     
     
     @State private var favoriteColor = 0
     
     var fish = ["All","Trout", "Walleye", "Sunny", "Croppie"]
     
     
     
     
     
     var body: some View {
        
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
        
         
        return ScrollView{
            
        
          VStack(spacing: 20) {
             
             Divider()
                .frame(width: screenWidth - 25, alignment: .center)
            
                
             
             VStack(alignment: .center, spacing: 20) {

                 Text("Location")
                     .bold()
                     .foregroundColor(.blue)

                 Picker(selection: $location, label: Text("What is your favorite color?")) {
                     Text("Local").tag("local")
                     Text("Global").tag("all")

                 }.pickerStyle(SegmentedPickerStyle())

             }.frame(width: screenWidth - 25)
             
             Divider()
            .frame(width: screenWidth - 25)

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
//
             Divider()
            .frame(width: screenWidth - 25)

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
             
             Divider()
            .frame(width: screenWidth - 25)

             Text("Type")
                 .bold()
                 .foregroundColor(.blue)


             ZStack{
                 RoundedRectangle(cornerRadius: 50)
                     .stroke(Color(UIColor.systemGray6), lineWidth: 2)
                     .frame(width: 375.0, height: 200)
                     .foregroundColor(Color(UIColor.systemGray6))


                 Picker(selection: $type, label: Text("")) {
                     ForEach(0 ..< fish.count) {
                         Text(self.fish[$0]).tag(self.fish[$0])

                     }

                 }


                 .foregroundColor(.blue)
                 .labelsHidden()

             }.frame(width: screenWidth - 25)
            
            Divider()
                       .frame(width: screenWidth - 25)

         }.navigationBarTitle("Filter", displayMode: .inline)
//             .padding(.horizontal)
             .frame(minWidth: 0,
                    maxWidth: .infinity,
                    minHeight: 0,
                    maxHeight: .infinity,
                    alignment: .top)
         
         
        }
        
         
         
         
         
     }
     
     
     
     
     
     
}

struct TestView2_Previews: PreviewProvider {
    static var previews: some View {
        TestView2()
    }
}
