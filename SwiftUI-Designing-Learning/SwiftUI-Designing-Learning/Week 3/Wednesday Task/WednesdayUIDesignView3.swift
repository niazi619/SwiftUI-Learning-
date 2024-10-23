//
//  WednesdayUIDesignView3.swift
//  SwiftUI-Designing-Learning
//
//  Created by Apple on 23/10/2024.
//

import SwiftUI

struct WednesdayUIDesignView3: View {
    
    @State var index: Int = 0
    @State var search: String = ""
    
    @ObservedObject var vm = WednesdayUIDesignViewModel3()
    
    var body: some View {
        
        ZStack{
            Color.black
                .ignoresSafeArea()
            VStack(alignment: .leading){
                
                header
                
                Text("Popular")
                    .FontForegroundColorModifier(28, .bold, .rounded, nil, nil, Color("customYellow"))
                    .scaleEffect(x:1.2 ,y: 2)
                    .tracking(2)
                    .padding([.bottom,.horizontal])
                
                textAndHorizantalTabBar
                
                textFieldView
                
                moviewScrollView
                
            }
            .padding(.horizontal)
        }
        
    }
    
    var header: some View {
        HStack{
            Spacer()
            
            Image(systemName: "wrench.adjustable")
                .resizable()
                .FontForegroundColorModifier(nil, .regular, .default, 25, 25, Color("customYellow"))
        }
    }
    
    var textAndHorizantalTabBar: some View {
        HStack(spacing: 8) {
            Text("Popular")
                .FontForegroundColorModifier(14, index == 0 ? .semibold : .regular, .rounded, nil, nil, .white)
                .FrameBackgroundColorModifier( index == 0 ? 90 : 75, 35, .gray, index == 0 ? 0.6 : 0, 10)
                .padding(.leading,index == 0 ? 10 : 10)
                .onTapGesture {
                    withAnimation(.easeIn){
                        index = 0
                    }
                }
            
            Rectangle().fill(Color.gray.opacity(0.5 ))
                .frame(width: 1 ,height: 25)
                .padding(.horizontal ,0)
            
            Text("Top Rated")
                .FontForegroundColorModifier(14, index == 1 ? .semibold : .regular, .rounded, nil, nil, .white)
                .FrameBackgroundColorModifier( index == 1 ? 90 : 75, 35, .gray, index == 1 ? 0.6 : 0, 10)
                .onTapGesture {
                    withAnimation(.easeIn){
                        index = 1
                    }
                }
            
            Rectangle().fill(Color.gray.opacity(0.5 ))
                .frame(width: 1 ,height: 25)
                .padding(.horizontal ,0)
            
            Text("Upcoming")
                .FontForegroundColorModifier(14, index == 2 ? .semibold : .regular, .rounded, nil, nil, .white)
                .FrameBackgroundColorModifier( index == 2 ? 90 : 75, 35, .gray, index == 2 ? 0.6 : 0, 10)
                .onTapGesture {
                    withAnimation(.easeIn){
                        index = 2
                    }
                }
            
            Rectangle().fill(Color.gray.opacity(0.5 ))
                .frame(width: 1 ,height: 25)
                .padding(.horizontal ,0)
            
            Text("Now Playing")
                .FontForegroundColorModifier(14, index == 3 ? .semibold : .regular, .rounded, nil, nil, .white)
                .FrameBackgroundColorModifier( index == 3 ? 95 : 85, 35, .gray, index == 3 ? 0.6 : 0, 10)
                .padding(.trailing,index == 3 ? 0 : 15)
                .onTapGesture {
                    withAnimation(.easeIn){
                        index = 3
                    }
                }
            
        }
        .FrameBackgroundColorModifier(380, 35, Color("customGray"), 0.6, 10)
    }
    
    var textFieldView: some View {
        HStack(spacing: 10) {
            
            Button(action: {}, label: {
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .FontForegroundColorModifier(18, .regular, .default, 18, 18, .white)
            })
            
            ZStack{
                if search.isEmpty {
                    Text("Search any movies")
                        .FontForegroundColorModifier(18, .regular, .default, 320, 25, .gray)
                        .offset(x:-70)
                }
                
                TextField("", text: $search)
                    .FontForegroundColorModifier(18, .regular, .default, 320, 25, .white)
            }
            
        }
        .padding(.vertical)

    }
    
    var moviewScrollView: some View {
        ScrollView {
            
            VStack(alignment: .center) {
                ForEach(vm.dataList.indices) { index in
                    HStack(spacing:10){
                        
                        Image(vm.dataList[index].image)
                            .resizable()
                            .scaledToFit()
                            .FrameBackgroundColorModifier(140, 170, nil, 1, 15)
                        
                        VStack(alignment: .leading) {
                            
                            Text(vm.dataList[index].movieName)
                                .FontForegroundColorModifier(16, .bold, .rounded, nil, 50, Color("customYellow"))
                                .scaleEffect(x:1.2 ,y: 2)
//                                    .tracking(2)
                                .padding(.horizontal,5)
//                                        .padding([.bottom,.horizontal])
                            
                            HStack{
                                
                                Text(vm.dataList[index].ringPercentage)
                                    .FontForegroundColorModifier(12, .regular, .default, nil, nil, .gray)
                                    .overlay(Circle()
                                        .stroke(
                                            index == 0 ? Color.green : Color.yellow , lineWidth: 3
                                        )
                                            .frame(width: 45 ,height: 45)
                                            .shadow(color: (index == 0 ? Color.green : Color.yellow).opacity(0.7), radius: 10, x: 0, y: 0))
                                    .padding(7)
                                
                                Text(vm.dataList[index].date)
                                    .FontForegroundColorModifier(16, .regular, .default, nil, nil, .gray)
                            }
                            
                            Text(vm.dataList[index].discripation)
                                .FontForegroundColorModifier(18, .regular, .default, nil, 70, .gray)
                            
                        }
                        
                        Image(systemName: "chevron.right")
                            .resizable()
                            .FontForegroundColorModifier(15, .regular, .default, 9, 12, .white)
                    }
                    .frame(width: 380)
                    .padding(.bottom,20)
                    
                }
            }
            
        }
        .padding(.top)
        .scrollIndicators(.hidden)

    }
    
}

struct WednesdayUIDesignView3_Previews: PreviewProvider {
    static var previews: some View {
        WednesdayUIDesignView3()
    }
}
