//
//  testView.swift
//  lur
//
//  Created by Elijah Valine on 8/4/20.
//  Copyright © 2020 Elijah Valine. All rights reserved.
//

import SwiftUI

struct testView: View {
   
    @State private var favoriteColor = 0
    
    
    @State private var location = "local"
    
    
    var body: some View {
        
        return VStack(spacing: 20) {
            
            Divider()
                
            
            
            
            
            VStack(alignment: .leading, spacing: 20) {
                
                Text("Location")
                    .bold()
                    .foregroundColor(.blue)
                
                Picker(selection: $location, label: Text("What is your favorite color?")) {
                    Text("Local").tag("local")
                    Text("Global").tag("global")
                    
                }.pickerStyle(SegmentedPickerStyle())
                
                
                
            }
            Divider()
            
            VStack(alignment: .leading, spacing: 20) {
                
                Text("Location")
                    .bold()
                    .foregroundColor(.blue)
                
                Picker(selection: $location, label: Text("What is your favorite color?")) {
                    Text("Local").tag("local")
                    Text("Global").tag("global")
                    
                }.pickerStyle(SegmentedPickerStyle())
                
                
                
            }
            Divider()
            
            VStack(alignment: .center, spacing: 20) {
                
                Text("Location")
                    .bold()
                    .foregroundColor(.blue)
                
                Picker(selection: $location, label: Text("What is your favorite color?")) {
                    Text("Local").tag("local")
                    Text("Global").tag("global")
                    
                }.pickerStyle(SegmentedPickerStyle())
                
                
                
            }
            Divider()
            
          
            
            
            
            
            
        }.navigationBarTitle("Filter")
            .padding(.horizontal)
        .frame(minWidth: 0,
        maxWidth: .infinity,
        minHeight: 0,
        maxHeight: .infinity,
        alignment: .topLeading)
          
        

        
        
        
        
    }
    
    
}

struct testView_Previews: PreviewProvider {
    static var previews: some View {
        testView()
    }
}
