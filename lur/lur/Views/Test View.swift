//
//  Test View.swift
//  lur
//
//  Created by Elijah Valine on 8/7/20.
//  Copyright © 2020 Elijah Valine. All rights reserved.
//

import SwiftUI

struct Test_View: View {
    
    
    @State var blue:Bool = false
    @State var red:Bool = false
    @State var purple:Bool = false
    @State var yellow:Bool = false
    @State var green:Bool = false
    
    let width = UIScreen.screenWidth
    let height = UIScreen.screenHeight
    @State var big = false
    @State var bigger = false
    @State var huge = false
    @State var labeler:String = "Hello There"
    @State private var showPopUp = false
    @State var message = "Ope! It looks like you have location services turned off"
    
    @State private var showDetail = false
    @State private var agreedToTerms = false
    
    let screenSize: CGRect = UIScreen.main.bounds
    
    
    @ObservedObject private var locationManager = LocationManager()
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    
    var multipurpose = "hello"
    var fish = ["Trout", "Walleye", "Sunny", "Croppie"]
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
        
        return ZStack{
            
            
            VStack(alignment: .center, spacing: 20.0) {
                
                ZStack{
                    
                    RoundedRectangle(cornerRadius: 50)
                        
                    
                        .stroke(Color(UIColor.systemGray6), lineWidth: 2)
//                        .frame(width:screenWidth-25)
                    
                        .frame(width: screenWidth - 25, height: screenWidth*0.12 + (Calculator.circleSpacing(width: screenWidth)*2), alignment: .trailing)
                        .foregroundColor(Color(UIColor.systemBackground))
                        .shadow(color: Color.black.opacity(0.2), radius: 7, x: 0, y: 2)
                    
                    
//
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
                
//
                ZStack{
//
                    RoundedRectangle(cornerRadius: 50)
                        .stroke(Color(UIColor.systemGray6), lineWidth: 2)
                        .frame(width: screenWidth-25, height: screenWidth*0.242 + 60)
                        .foregroundColor(Color(UIColor.systemGray6))
                        .shadow(color: Color.black.opacity(0.2), radius: 7, x: 0, y: 2)

                    HStack(){
                        Toggle(isOn: big1) {
                            Text("")
                        }
                        .toggleStyle(SmallFishyToggleStyle())
//
                        Toggle(isOn: big2) {
                            Text("")
                        }

                        .toggleStyle(MediumFishyToggleStyle())
//
                        Toggle(isOn: big3) {
                            Text("")
                        }
                        .toggleStyle(FishyToggleStyle())
                    }
//
//
//
                }
//
//
                ZStack{
//
                    RoundedRectangle(cornerRadius: 50)
                        .stroke(Color(UIColor.systemGray6), lineWidth: 2)
                        .frame(width: screenWidth-25, height: 200)
                        .foregroundColor(Color(UIColor.systemGray6))
                        .shadow(color: Color.black.opacity(0.2), radius: 7, x: 0, y: 2)
//
//
                   Picker(selection: $selectedFish, label: Text("")) {
                       ForEach(0 ..< fish.count) {
                           Text(self.fish[$0])
                       }
                   }.foregroundColor(.blue)
                       .labelsHidden()
                       .frame(width: 200.0, height: 200.0)
                   

//
//
                }
//
//
//
//
//
                    //Add Fish
                    Button(action: {
                            print(screenWidth)
                    }) {

                        ZStack{


                            Image(systemName: "plus.circle.fill")


                                .foregroundColor(.blue)
                                .font(.system(size: 50))
                                .rotationEffect(.degrees(showDetail ? 180 : 0))
                                .animation(.easeInOut)



                        }

                    }.disabled(agreedToTerms)
//
//
//
//
//
//            }
//                //        .edgesIgnoringSafeArea(.all)
//                //            .statusBar(hidden: true)
//                //            .padding(.top, 0.)
//                //            .navigationBarBackButtonHidden(true)
//                .navigationBarTitle(Text("New Fish").foregroundColor(.blue))
//                .frame(minWidth: 0,
//                       maxWidth: .infinity,
//                       minHeight: 0,
//                       maxHeight: .infinity,
//                       alignment: .topLeading)
//
//
//            //            }
//
//
        }
        }.navigationBarTitle("Filter")
    }
    
}

struct Test_View_Previews: PreviewProvider {
    static var previews: some View {
        Test_View()
    }
}
