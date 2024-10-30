//
//  WednesdayUIDesignView4.swift
//  SwiftUI-Designing-Learning
//
//  Created by Apple on 30/10/2024.
//

import SwiftUI

struct WednesdayUIDesignView4: View {
    var body: some View {
        ZStack{
            
            VStack{
                
                header
                
                labelDisplayView
                    .padding(.bottom)
                
                trackingRingsView
                
                Spacer()
                
            }
            
        }
    }
    
    var header: some View {
        VStack(alignment: .leading){
            Text("Hi, Jane!")
                .FontForegroundColorModifier(33, .light, .default, nil, nil, .primary)
            
            Text("Today is Wednesday,")
                .FontForegroundColorModifier(22, .bold, .default, nil, nil, .primary)
        }
        .padding(.trailing,150)
        .padding(.vertical,30)
    }
    
    var labelDisplayView: some View {
        HStack{
            Image(systemName: "figure.walk")
                .resizable()
                .FontForegroundColorModifier(22, .bold, .default, 20, 30, .primary)
            Text("You've walked 5 miles today. Nice work!")
                .FontForegroundColorModifier(22, .regular, .default, nil, nil, .primary)
        }
        .padding(.horizontal)
        .padding()
        .overlay(RoundedRectangle(cornerRadius: 15)
            .stroke(Color.gray.opacity(0.4) ,lineWidth: 1))
    }
    
    var trackingRingsView: some View {
        VStack(spacing: 30){
            
            Text("Your stats")
                .FontForegroundColorModifier(17, .medium, .default, nil, nil, .primary)
            
            HStack(spacing: 40){
                
                VStack{
                    Text("Fat")
                        .FontForegroundColorModifier(18, .medium, .default, nil, nil, .orange)
                    
                    ZStack{
                        Circle()
                            .stroke(Color.orange.opacity(0.2) , lineWidth: 8)
                            .frame(width: 70 ,height: 70)
                        
                        Circle()
                            .trim(from: 0 ,to: 0.8)
                            .stroke(Color.orange , lineWidth: 8)
                            .rotationEffect(.degrees(-90))
                            .frame(width: 70 ,height: 70)
                        
                        VStack{
                            Text("27")
                                .FontForegroundColorModifier(17, .regular, .default, nil, nil, .primary)
                            Text("35")
                                .FontForegroundColorModifier(17, .semibold, .default, nil, nil, .primary)
                        }
                        
                        
                    }
                }
                
                VStack{
                    Text("Protein")
                        .FontForegroundColorModifier(18, .medium, .default, nil, nil, .blue)
                    
                    ZStack{
                        Circle()
                            .stroke(Color.blue.opacity(0.2) , lineWidth: 8)
                            .frame(width: 70 ,height: 70)
                        
                        Circle()
                            .trim(from: 0 ,to: 0.76)
                            .stroke(Color.blue , lineWidth: 8)
                            .rotationEffect(.degrees(-90))
                            .frame(width: 70 ,height: 70)
                        
                        VStack{
                            Text("45")
                                .FontForegroundColorModifier(17, .regular, .default, nil, nil, .primary)
                            Text("66")
                                .FontForegroundColorModifier(17, .semibold, .default, nil, nil, .primary)
                        }
                        
                        
                    }
                }
                
                VStack{
                    Text("Carbs")
                        .FontForegroundColorModifier(18, .medium, .default, nil, nil, .green)
                    
                    ZStack{
                        Circle()
                            .stroke(Color.green.opacity(0.2) , lineWidth: 8)
                            .frame(width: 70 ,height: 70)
                        
                        Circle()
                            .trim(from: 0 ,to: 0.6)
                            .stroke(Color.green , lineWidth: 8)
                            .rotationEffect(.degrees(-90))
                            .frame(width: 70 ,height: 70)
                        
                        VStack{
                            Text("131")
                                .FontForegroundColorModifier(17, .regular, .default, nil, nil, .primary)
                            Text("163")
                                .FontForegroundColorModifier(17, .semibold, .default, nil, nil, .primary)
                        }
                        
                        
                    }
                }
                
                
            }
            
            
        }
        .padding(.horizontal,25)
        .padding()
        .overlay(RoundedRectangle(cornerRadius: 15)
            .stroke(Color.gray.opacity(0.4) ,lineWidth: 1))
    }
    
}

struct WednesdayUIDesignView4_Previews: PreviewProvider {
    static var previews: some View {
        WednesdayUIDesignView4()
    }
}
