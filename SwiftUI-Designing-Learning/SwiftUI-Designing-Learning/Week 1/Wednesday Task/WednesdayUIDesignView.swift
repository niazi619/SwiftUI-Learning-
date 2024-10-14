//
//  WednesdayUIDesignView.swift
//  SwiftUI-Designing-Learning
//
//  Created by Apple on 09/10/2024.
//

import SwiftUI

struct WednesdayUIDesignView: View {
    
    @ObservedObject var vm = WednesdayUIDesignViewModel()
    
    var body: some View {
        
        ZStack{
            Image("whitePrintedBackground")
                .resizable()
                .ignoresSafeArea()
                .frame(width: 450 ,height: 1200)
            
            VStack{
                
                headerView
                                
                cardView
                
                Spacer()
                
                buttonView
                
            }
            .frame(width: 400 ,height: 750)
            
        }
        
    }
    
    var headerView: some View {
        HStack{
            
            Button(action: {

            }, label: {
                Image(systemName: "chevron.backward")
                    .resizable()
                    .FontForegroundColorModifier(nil, nil, nil, 13, 26, Color("customGrayishBlue"))
            })
            
            Spacer()
            
            Text("My")
                .FontForegroundColorModifier(30, .heavy, .default, nil, nil, Color("customRegalBlue"))
            
            Spacer()
        }
        .padding(.horizontal,30)
        .padding(.bottom)
        
    }
    
    var cardView: some View {
        ScrollView{
            VStack(alignment: .center ,spacing: 15) {
                ForEach(vm.carsDataList.indices, id: \.self) { index in
                    
                    HStack{
                        
                        VStack(alignment: .leading ,spacing: 5) {
                            Text("Toyota")
                            
                            Text("Car")
                            
                            Text("Enter Number")
                            
                            Text("Enter")
//                                    Text("\(vm.carsDataList[index])")
                        }
                        .FontForegroundColorModifier(16, .semibold, .default, nil, nil, Color("customRegalBlue"))
                        
                        Spacer()
                        
                        VStack(alignment: .trailing ,spacing: 12) {
                            
                            Button(action: {
                                vm.deleteItem(at: index)
                            }, label: {
                                Text("Delete")
                                    .FontForegroundColorModifier(16, .medium, .default, nil, nil,.white)
                                    .FrameBackgroundColorModifier(90, 25, Color.red, 1, 15)
                            })
                            
                            Text("Seda")
                                .FontForegroundColorModifier(14, .light, .default, nil, nil, Color("customRegalBlue"))
                            
                            Text("GLT-23")
                                .FontForegroundColorModifier(14, .light, .default, nil, nil, Color("customRegalBlue"))
                            
                            Text("200")
                                .FontForegroundColorModifier(14, .light, .default, nil, nil, Color("customRegalBlue"))
                        }
                        
                    }
                    .padding()
                    .FrameBackgroundColorModifier(355, 130, Color.white, 1, 5)
                    .overlay(RoundedRectangle(cornerRadius: 5)
                        .stroke(Color("customDarkCyan"),
                                lineWidth: 2))
                    
                }
            }
        }
    }
    
    var buttonView: some View {
        Button(action: {
            
        }, label: {
            Text("Add Car")
                .FontForegroundColorModifier(15, .heavy, .default, 320, 50, .white)
                .FrameBackgroundColorModifier(320, 50, nil, 1, 25)
                .background(
                    LinearGradient(
                        gradient: Gradient(colors: [Color("customLightBlue"),Color("customRegalBlue2")]),
                        startPoint: .top,
                        endPoint: .bottom)
                ).cornerRadius(5)
        })
    }
    
}

struct WednesdayUIDesignView_Previews: PreviewProvider {
    static var previews: some View {
        WednesdayUIDesignView()
    }
}
