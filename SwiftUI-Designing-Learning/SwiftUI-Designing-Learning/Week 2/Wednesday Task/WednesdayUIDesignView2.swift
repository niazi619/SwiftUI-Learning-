//
//  WednesdayUIDesignView2.swift
//  SwiftUI-Designing-Learning
//
//  Created by Apple on 15/10/2024.
//

import SwiftUI

struct WednesdayUIDesignView2: View {
    
    @ObservedObject var vm = WednesdayUIDesignViewModel2()
    
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            VStack{
                
                HStack{
                    Spacer()
                    Text("PRO")
                        .FontForegroundColorModifier(18, .medium, .default, nil, nil, .black)
                        .FrameBackgroundColorModifier(80, 35, .yellow, 1, 25)
                }
                .padding(.bottom)
                
                ScrollView{
                    VStack(spacing: 30){
                        VStack(alignment: .leading ,spacing: 30) {
                            Text("Styles(Optional)")
                                .FontForegroundColorModifier(20, .medium, .default, nil, nil, .white)
                            
                            ScrollView(.horizontal){
                                
                                HStack(spacing: 15) {
                                    ForEach(vm.tatooStylesDataList) { obj in
                                        VStack{
                                            Image(obj.tatooImage ?? "")
                                                .resizable()
                                                .FrameBackgroundColorModifier(90, 90, nil, 1, 20)
                                                .background(
                                                    obj.idNo == 0 ? AnyView(RadialGradient(
                                                        gradient: Gradient(colors: [Color.black, Color.white]),
                                                        center: .bottom,
                                                        startRadius: 35,
                                                        endRadius: 80))
                                                    : AnyView(obj.backgroundView)
                                                ).cornerRadius(25)
                                            Text(obj.tatooStyle ?? "")
                                                .FontForegroundColorModifier(18, .light, .default, nil, nil, .white)
                                        }
                                    }
                                }
                            }
                            .scrollIndicators(.hidden)
                        }
                        
                        Button(action: {
                            
                        }, label: {
                            Text("Generate")
                                .FontForegroundColorModifier(20, .medium, .default, nil, nil, Color("customSpanishGray"))
                                .FrameBackgroundColorModifier(370, 65, Color("customGray"), 1, 15)
                        })
                        
                        VStack(alignment: .leading ,spacing: 15){
                            Text("Inspiration")
                                .FontForegroundColorModifier(20, .medium, .default, nil, nil, .white)
                            
                            LazyVGrid(columns: vm.columns ,spacing: 15) {
                                ForEach(vm.tatooImagesDataList) { obj in
                                    
                                    Image(obj.tatooImage ?? "")
                                        .resizable()
                                        .scaledToFit()
                                        .FrameBackgroundColorModifier(175, 220, nil, 1, 15)
                                        .background(AnyView(obj.backgroundView))
                                        .cornerRadius(15)
                                    
                                }
                            }
                            
                        }
                        
                    }
                }
                .scrollIndicators(.hidden)
                
            }
            .padding(.horizontal)
        }
        
    }
}

struct WednesdayUIDesignView2_Previews: PreviewProvider {
    static var previews: some View {
        WednesdayUIDesignView2()
    }
}
