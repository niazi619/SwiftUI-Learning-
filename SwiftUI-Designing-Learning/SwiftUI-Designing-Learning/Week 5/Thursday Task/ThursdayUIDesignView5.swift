//
//  ThursdayUIDesignView5.swift
//  SwiftUI-Designing-Learning
//
//  Created by Apple on 08/11/2024.
//

import SwiftUI

struct ThursdayUIDesignView5: View {
    var body: some View {
        ZStack{
            
            ZStack(alignment: .top){
                
                Form{
                    Section {
                        VStack{
                            textView
                            circularProgressBarsView
                            caloriesCalculationView
                        }
                        .frame(width: 400)
                    }
                    .frame(width: 400)
                    
                    Section {
                        breakfastGoodsView
                    }
                }
                .frame(width: 430)
                .offset(y:-15)
                
                header
                
            }
            
        }
    }
    
    var header: some View {
        
        HStack{
            Image(systemName: "arrow.left")
                .resizable()
                .FontForegroundColorModifier(20, .regular, .default, 20, 20, .black)
                .offset(y:30)
            Spacer()
        }
        .padding(.horizontal,30)
        .FrameBackgroundColorModifier(400, 80, .white, 1, 0)
        .offset(y:-60)
        
    }
    
    var textView: some View {
        VStack {
            Text("You have consumed")
                .font(.system(size: 22 ,weight: .medium)) +
            Text(" 500 cal ")
                .font(.system(size: 22 ,weight: .medium))
                .foregroundColor(Color("customPurple")) +
            Text("today")
                .font(.system(size: 22 ,weight: .medium))
        }
        .frame(width: 200)
        .multilineTextAlignment(.center)
    }
    
    var circularProgressBarsView: some View {
        
        ZStack{
            
            Circle()
                .trim(from: 0 ,to: 0.75)
                .stroke(Color("customOrange"),style: StrokeStyle(lineWidth: 12 ,lineCap: .round ,lineJoin: .round))
                .frame(width: 200 ,height: 200)
                .rotationEffect(.degrees(-90))
                .background {
                    Circle()
                        .stroke(Color.gray.opacity(0.15),style: StrokeStyle(lineWidth: 12 ,lineCap: .round ,lineJoin: .round))
                        .frame(width: 200 ,height: 200)
                }
            
            Circle()
                .trim(from: 0 ,to: 0.65)
                .stroke(Color("customPurple"),style: StrokeStyle(lineWidth: 12 ,lineCap: .round ,lineJoin: .round))
                .frame(width: 167 ,height: 167)
                .rotationEffect(.degrees(-90))
                .background {
                    Circle()
                        .stroke(Color.gray.opacity(0.15),style: StrokeStyle(lineWidth: 12 ,lineCap: .round ,lineJoin: .round))
                        .frame(width: 167 ,height: 167)
                }
            
            Circle()
                .trim(from: 0 ,to: 0.5)
                .stroke(Color("customGreen2"),style: StrokeStyle(lineWidth: 12 ,lineCap: .round ,lineJoin: .round))
                .frame(width: 134 ,height: 134)
                .rotationEffect(.degrees(-90))
                .background {
                    Circle()
                        .stroke(Color.gray.opacity(0.15),style: StrokeStyle(lineWidth: 12 ,lineCap: .round ,lineJoin: .round))
                        .frame(width: 134 ,height: 134)
                }
            
            VStack{
                Text("40%")
                    .FontForegroundColorModifier(20, .heavy, .default, nil, nil, .primary)
                
                Text("of daily goals")
                    .FontForegroundColorModifier(10, .regular, .default, 50, nil, .gray)
            }
            
        }
        .frame(width: 350)
        .padding(.vertical,25)
    }
    
    var caloriesCalculationView: some View {
        VStack(spacing: 20) {
            
            HStack{
                
                HStack{
                    RoundedRectangle(cornerRadius: 4).fill(Color("customGray"))
                        .frame(width: 15 ,height: 15)
                    Text("Carb")
                        .FontForegroundColorModifier(17, .regular, .default, nil, nil, .primary)
                }
                Spacer()
                
                Text("100 g")
                    .FontForegroundColorModifier(17, .regular, .default, nil, nil, .primary)
                Spacer()
                
                Text("32%")
                    .FontForegroundColorModifier(17, .heavy, .default, nil, nil, .primary)
            }
            
            HStack{
                
                HStack{
                    RoundedRectangle(cornerRadius: 4).fill(Color("customPurple2"))
                        .frame(width: 15 ,height: 15)
                    Text("Canxi")
                        .FontForegroundColorModifier(17, .regular, .default, nil, nil, .primary)
                }
                Spacer()
                
                Text("90 g")
                    .FontForegroundColorModifier(17, .regular, .default, nil, nil, .primary)
                Spacer()
                
                Text("40%")
                    .FontForegroundColorModifier(17, .heavy, .default, nil, nil, .primary)
            }
            
            HStack{
                
                HStack{
                    RoundedRectangle(cornerRadius: 4).fill(Color.blue)
                        .frame(width: 15 ,height: 15)
                    Text("Fat")
                        .FontForegroundColorModifier(17, .regular, .default, nil, nil, .primary)
                }
                Spacer()
                
                Text("100 g")
                    .FontForegroundColorModifier(17, .regular, .default, nil, nil, .primary)
                Spacer()
                
                Text("20%")
                    .FontForegroundColorModifier(17, .heavy, .default, nil, nil, .primary)
            }
            
        }
        .padding(.horizontal,30)
    }
    
    var breakfastGoodsView: some View {
        VStack(spacing: 20) {
            
            HStack{
                Text("Breakfast")
                    .FontForegroundColorModifier(19, .heavy, .default, nil, nil, .primary)
                Spacer()
                
                Image(systemName: "ellipsis")
                    .resizable()
                    .FontForegroundColorModifier(20, .regular, .default, 20, 5, .gray.opacity(0.5))
            }
            
            HStack{
                Image("pizzaSliceLogo")
                    .resizable()
                    .frame(width: 40 ,height: 40)
                
                VStack(alignment: .leading,spacing: 8){
                    Text("Nutrition")
                        .FontForegroundColorModifier(16, .regular, .default, nil, nil, .primary)
                    
                    Text("300 cal / 1200 cal")
                        .FontForegroundColorModifier(11, .regular, .default, nil, nil, .gray)
                }
                Spacer()
                Text("50")
                    .FontForegroundColorModifier(16, .heavy, .default, nil, nil, .primary)
            }
            
            HStack{
                Image("waterDropLogo")
                    .resizable()
                    .frame(width: 40 ,height: 40)
                
                VStack(alignment: .leading,spacing: 8){
                    Text("Water")
                        .FontForegroundColorModifier(16, .regular, .default, nil, nil, .primary)
                    
                    Text("3 / 8 glasses")
                        .FontForegroundColorModifier(11, .regular, .default, nil, nil, .gray)
                }
                Spacer()
                Text("50")
                    .FontForegroundColorModifier(16, .heavy, .default, nil, nil, .primary)
            }
            
            HStack{
                Image("shoeLogo")
                    .resizable()
                    .frame(width: 40 ,height: 40)
                
                VStack(alignment: .leading,spacing: 8){
                    Text("Daily Steps")
                        .FontForegroundColorModifier(16, .regular, .default, nil, nil, .primary)
                    
                    Text("1000 / 1200 steps")
                        .FontForegroundColorModifier(11, .regular, .default, nil, nil, .gray)
                }
                Spacer()
                Text("50")
                    .FontForegroundColorModifier(16, .heavy, .default, nil, nil, .primary)
            }
            
            
        }
//        .padding(27)
    }
    
}

struct ThursdayUIDesignView5_Previews: PreviewProvider {
    static var previews: some View {
        ThursdayUIDesignView5()
    }
}
