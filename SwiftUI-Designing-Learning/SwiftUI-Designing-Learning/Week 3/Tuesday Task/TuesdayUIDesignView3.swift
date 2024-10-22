//
//  TuesdayUIDesignView3.swift
//  SwiftUI-Designing-Learning
//
//  Created by Apple on 22/10/2024.
//

import SwiftUI

struct TuesdayUIDesignView3: View {
    
    @ObservedObject var vm = TuesdayUIDesignViewModel3()
    
    var body: some View {
        
        ZStack{
            
            VStack{
                
                header
                scrollBodyView
                                
            }
            .padding(.horizontal)
        }
        
    }
    
    var header: some View {
        HStack{
            Spacer()
            
            Text("HOME")
                .FontForegroundColorModifier(18, .heavy, .default, nil, nil, .black)
            
            Spacer()
            
            Button(action: {}, label: {
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .FontForegroundColorModifier(18, .regular, .default, 20, 20, .black)
            })
            
        }
    }
    
    var scrollBodyView: some View {
        ScrollView {
            ForEach(vm.dataList.indices) { index in
                VStack(alignment: .leading){
                    
                    HStack{
                        Image("profileImage2")
                            .resizable()
                            .frame(width: 50 ,height: 50)
                        
                        VStack(alignment: .leading) {
                            Text("Muhammad Asad")
                                .FontForegroundColorModifier(17, .semibold, .default, nil, nil, .black)
                            Text("48 min ago")
                                .FontForegroundColorModifier(14, .regular, .default, nil, nil, .gray)
                        }
                        
                        Spacer()
                        
                        Button(action: {}, label: {
                            Text("FOLLOW")
                                .FontForegroundColorModifier(13, .bold, .default, nil, nil, .white)
                                .FrameBackgroundColorModifier(90, 30, .pink, 1, 20)
                        })
                    }
                    
                    Text("Which one looks better")
                        .FontForegroundColorModifier(17, .regular, .default, nil, nil, .black)
                    
                    HStack(spacing: 3){
                        ZStack(alignment: Alignment(horizontal: .leading, vertical: .bottom)) {
                            Image(vm.dataList[index].imageA)
                                .resizable()
                                .scaledToFill()
                            Image(systemName: "checkmark.circle.fill")
                                .resizable()
                                .FontForegroundColorModifier(nil, .regular, .default, 30, 30, vm.dataList[index].isCheckedA == true ? .pink : .gray)
                                .offset(x:10,y:-10)
                        }
                        .onTapGesture {
                            withAnimation(){
                                vm.dataList[index].isCheckedA = true
                                vm.dataList[index].isCheckedB = false
                            }
                        }
                        
                        ZStack(alignment: Alignment(horizontal: .leading, vertical: .bottom)) {
                            Image(vm.dataList[index].imageB)
                                .resizable()
                                .scaledToFill()
                            Image(systemName: "checkmark.circle.fill")
                                .resizable()
                                .FontForegroundColorModifier(nil, .regular, .default, 30, 30, vm.dataList[index].isCheckedB == true ? .pink : .gray)
                                .offset(x:10,y:-10)
                        }
                        .onTapGesture {
                            withAnimation(){
                                vm.dataList[index].isCheckedA = false
                                vm.dataList[index].isCheckedB = true
                            }
                        }
                    }
                    .background(Color.black)
                    .FrameBackgroundColorModifier(350, 170, nil, 1, 15)
                    .cornerRadius(15)
                    
                    HStack(spacing: 12){
                        Image(systemName: "heart")
                            .resizable()
                            .frame(width: 21 ,height: 21)
                        Image(systemName: "message")
                            .resizable()
                            .frame(width: 18 ,height: 23)
                        Image("shareLogo")
                            .resizable()
                            .frame(width: 23 ,height: 23)
                        Spacer()
                        Image("threeDotsLogo")
                            .resizable()
                            .frame(width: 35 ,height: 35)
                    }
                    
                    Text("wahab381")
                        .font(.system(size: 14 ,weight: .bold)) +
                    Text(" left one is good!")
                        .font(.system(size: 14))
                    
                    Text("View all 8 comments")
                        .FontForegroundColorModifier(13, .regular, .default, nil, nil, .gray)
                    
                }
                .padding(.bottom)
                
            }
            
        }
        .padding(.horizontal)
        .scrollIndicators(.hidden)

    }
    
}

struct TuesdayUIDesignView3_Previews: PreviewProvider {
    static var previews: some View {
        TuesdayUIDesignView3()
    }
}
