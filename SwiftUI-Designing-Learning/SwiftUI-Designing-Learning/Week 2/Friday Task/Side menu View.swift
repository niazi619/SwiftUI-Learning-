//
//  Side menu View.swift
//  SwiftUI-Designing-Learning
//
//  Created by Apple on 25/10/2024.
//


import SwiftUI

struct SideMenuView: View {
    
    @ObservedObject var vm = FridayUIDesignViewModel2()
    
    var body: some View {
        
        ZStack{
            
            LinearGradient(gradient:
                            Gradient(colors: [Color("customMulberryPurple"),Color("customBlue")]),
                           startPoint: .topTrailing,
                           endPoint: .bottomLeading)
            .frame(width: 300)
            //            .mask(RoundedRectangle(cornerRadius: 10))
            
            VStack(spacing: 15){
                
                labelsView
                
                categoriesScrollView
                
                bottomView
                
            }
            
            
        }
        .ignoresSafeArea()
        .frame(maxWidth: .infinity ,maxHeight: .infinity ,alignment: .leading)
        
    }
    
    var labelsView: some View {
        VStack{
            Text("I have an account")
                .FontForegroundColorModifier(18, .semibold, .default, nil, nil, Color("customBlue"))
                .FrameBackgroundColorModifier(260, 50, .white, 2, 7)
            
            Text("I don't have an account")
                .FontForegroundColorModifier(18, .semibold, .default, nil, nil, Color("customBlue"))
                .FrameBackgroundColorModifier(260, 50, .white, 2, 7)
            
            Text("Become a trainer")
                .FontForegroundColorModifier(18, .semibold, .default, nil, nil, Color("customBlue"))
                .FrameBackgroundColorModifier(260, 50, .white, 2, 7)
        }
        .padding(.top,50)

    }
    
    var categoriesScrollView: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(vm.textDataList.indices) { index in
                    VStack(alignment: .leading ,spacing: 10) {
                        
                        Text(vm.textDataList[index])
                            .FontForegroundColorModifier( index == 4 ? 16 : 18, .regular, .default, nil, nil, index == 4 ? .gray : .white)
                        Rectangle().fill( index == 4 ? Color.clear : Color.white)
                            .frame(width: 260 ,height: 1)
                        
                    }
                    .padding(.bottom,8)
                }
            }
        }
        .padding([.vertical,.top])

    }
    
    var bottomView: some View {
        HStack {
            
            Image("locationLogo")
                .resizable()
                .frame(width: 50 ,height: 50)
                .offset(y:-13)
            
            Spacer()
            
            Text("Version 1.0.1")
                .FontForegroundColorModifier(15, .regular, .default, nil, nil, .gray)
            
        }
        .frame(width: 260)
        .padding(.bottom)
    }
    
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}
