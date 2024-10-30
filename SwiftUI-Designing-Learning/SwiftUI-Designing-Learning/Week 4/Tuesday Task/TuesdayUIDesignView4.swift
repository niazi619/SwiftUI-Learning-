//
//  TuesdayUIDesignView4.swift
//  SwiftUI-Designing-Learning
//
//  Created by Apple on 28/10/2024.
//

import SwiftUI

struct TuesdayUIDesignView4: View {
    
    @State var customPink: Color = Color("customPink")
    @State var index: Int = 0
    
    @ObservedObject var vm = TuesdayUIDesignViewModel4()
    
    var body: some View {
        ZStack{
            
            Color.white
                .ignoresSafeArea()
            
            Rectangle().fill(customPink)
                .frame(width: 400 ,height: 150)
                .offset(y:-410)
            
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)) {
                VStack{
                    
                    header

                    horizantalTabBarView
                    
                    List {
                        
                        VStack(spacing: 15) {
                            ForEach(vm.dataList.indices) { index in
                                
                                Section {
                                    
                                    ScrollCardView(index: index)
                                    
                                }
                                .listRowInsets(EdgeInsets())
                            }
                            
                        }
                        
                    }
                    .frame(width: 450)
                    .offset(y:-10)
                       
                }
                
                Button(action: {}) {
                    HStack{
                        
                        Image(systemName: "plus")
                            .resizable()
                            .FontForegroundColorModifier(20, .regular, .default, 15, 15, .white)
                        
                        Text("Truth")
                    }
                    .padding()
                    .FontForegroundColorModifier(20, .regular, .default, nil, nil, .white)
                    .FrameBackgroundColorModifier(nil, 40, customPink, 1, 30)
                }
                .shadow(radius: 5 ,y: 6)
                .offset(x:-40 ,y: -30)
                
            }
            
        }
    }
    
    var header: some View {
        HStack{
            Image(systemName: "arrow.left")
                .resizable()
                .FontForegroundColorModifier(17, .semibold, .default, 17, 17, .white)
            
            Spacer()
            
            Text("Add Truths & Dares")
                .FontForegroundColorModifier(15, .semibold, .default, nil, nil, .white)
            
            Spacer()
        }
        .padding(.horizontal,50)
        .padding(.bottom,40)
        .offset(y:10)
    }
    
    var horizantalTabBarView: some View {
        HStack(spacing: 0) {
            Text("Truth")
                .FontForegroundColorModifier(12, index == 0 ? .semibold : .regular, .default, 178, 22, .black)
                .FrameBackgroundColorModifier( index == 0 ? 178 : 175, 22, index == 0 ? .white : .clear, 1, 5)
                .onTapGesture {
                    withAnimation(.easeIn(duration: 0.5)){
                        index = 0
                    }
                }
            
            Text("Dare")
                .FontForegroundColorModifier(12, index == 1 ? .semibold : .regular, .default, 178, 22, .black)
                .FrameBackgroundColorModifier( index == 1 ? 178 : 175, 22, index == 1 ? .white : .clear, 1, 5)
                .onTapGesture {
                    withAnimation(.easeIn(duration: 0.5)){
                        index = 1
                    }
                }
            
        }
        .FrameBackgroundColorModifier(360, 27, .gray, 0.3, 5)
        .offset(y:-7)
    }
    
}

struct TuesdayUIDesignView4_Previews: PreviewProvider {
    static var previews: some View {
        TuesdayUIDesignView4()
    }
}

struct ScrollCardView: View {
    
    @State var customPink: Color = Color("customPink")
    @State var index: Int
    @ObservedObject var vm = TuesdayUIDesignViewModel4()
    
    var body: some View {
        VStack(spacing: 5){
            VStack(alignment: .leading ,spacing: 15) {
                Text(vm.dataList[index].question)
                    .FontForegroundColorModifier(14, .light, .default, nil, nil, .black)
                
                labelsView
                
            }
            .frame(width: 360)
            
            Rectangle().fill(Color.gray.opacity(0.3))
                .frame(height: 1)
            
            HStack(spacing: 15){
                Spacer()
                Button(action: {}) {
                    Image(systemName: "pencil")
                        .resizable()
                        .FontForegroundColorModifier(nil, .heavy, .default, 15, 15, .black)
                }
                
                Button(action: {}) {
                    Image(systemName: "xmark.bin.fill")
                        .resizable()
                        .FontForegroundColorModifier(nil, .heavy, .default, 15, 15, .black)
                }
            }
            .frame(width: 360)
            .padding(.top)
            
        }
        .frame(width: 400 ,height: 170)
        .overlay(Rectangle()
            .stroke(Color.gray.opacity(0.4) ,lineWidth: 3))
        .padding(.horizontal)
    }
    
    var labelsView: some View {
        VStack(alignment: .leading){
            HStack{
                Text("👨👧 Teen")
                    .padding()
                    .FontForegroundColorModifier(14, .regular, .default, nil, nil, vm.dataList[index].colorCheck1 ? .white : .black)
                    .FrameBackgroundColorModifier(nil, 30, vm.dataList[index].colorCheck1 ? customPink : Color.gray, vm.dataList[index].colorCheck1 ? 1 : 0.3, 15)
                
                Text("👩👨 Adult")
                    .padding()
                    .FontForegroundColorModifier(14, .regular, .default, nil, nil, vm.dataList[index].colorCheck2 ? .white : .black)
                    .FrameBackgroundColorModifier(nil, 30, vm.dataList[index].colorCheck2 ? customPink : Color.gray, vm.dataList[index].colorCheck2 ? 1 : 0.3, 15)
                
                Text("👫🎢 Dating")
                    .padding()
                    .FontForegroundColorModifier(14, .regular, .default, nil, nil, vm.dataList[index].colorCheck3 ? .white : .black)
                    .FrameBackgroundColorModifier(nil, 30, vm.dataList[index].colorCheck3 ? customPink : Color.gray, vm.dataList[index].colorCheck3 ? 1 : 0.3, 15)
                
                Spacer()
            }
            HStack{
                Text("👫❤️ Relationship")
                    .padding()
                    .FontForegroundColorModifier(14, .regular, .default, nil, nil, vm.dataList[index].colorCheck4 ? .white : .black)
                    .FrameBackgroundColorModifier(nil, 30, vm.dataList[index].colorCheck4 ? customPink : Color.gray, vm.dataList[index].colorCheck4 ? 1 : 0.3, 15)
                
                Text("🍆🍑 Sexual")
                    .padding()
                    .FontForegroundColorModifier(14, .regular, .default, nil, nil, vm.dataList[index].colorCheck5 ? .white : .black)
                    .FrameBackgroundColorModifier(nil, 30, vm.dataList[index].colorCheck5 ? customPink : Color.gray, vm.dataList[index].colorCheck5 ? 1 : 0.3, 15)
                
                Spacer()
            }
        }
    }
    
}
