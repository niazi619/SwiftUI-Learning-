//
//  WednesdayUIDesignView5.swift
//  SwiftUI-Designing-Learning
//
//  Created by Apple on 07/11/2024.
//

import SwiftUI

struct WednesdayUIDesignView5: View {
    
    let totalSteps = 10000
    let currentSteps = 10000
    let caloriesBurned = 1300
    
    var body: some View {
        ZStack{
            
            Color.white
                .ignoresSafeArea()
            Rectangle().fill(
                LinearGradient(gradient: Gradient(colors: [Color("customPurple2"),Color("customPurple")]), startPoint: .leading, endPoint: .trailing)
                
            )
            .frame(width: 400 ,height: 360)
            .offset(y:-280)
            
            VStack{
                
                headerView
                
                
                cardView
                
                Text("Use our hashtag #momotaro on instagram and twitter")
                    .FontForegroundColorModifier(13, .medium, .default, nil, nil, .gray)
                    .padding(.bottom,70)
                
                buttonsView
                Spacer()
            }
        }
    }
    
    var headerView: some View {
        VStack{
            Text("Goal Achieved!")
                .FontForegroundColorModifier(23, .bold, .rounded, nil, nil, .white)
            
            Text("Share with friends")
                .FontForegroundColorModifier(23, .bold, .rounded, nil, nil, .white)
        }
    }
    
    var cardView: some View {
        VStack{
            
            HStack(spacing: 15) {
                Image("profileImage1")
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 50 ,height: 50)
                    .cornerRadius(50)
                    .scaledToFill()
                    .clipped()
                
                Text("Grace Saraswati")
                    .FontForegroundColorModifier(15, .bold, .rounded, nil, nil, .black)
                Spacer()
                    Image(systemName: "playstation.logo")
                    .resizable()
                    .FontForegroundColorModifier(40, .regular, .default, 30, 30, Color("customPurple"))
                    .cornerRadius(50)
                    .scaledToFill()
                    .clipped()
            }
            .padding(.horizontal,20)
            .offset(y:-20)
            
            ZStack{
                
                Circle()
                    .trim(from: 0 ,to: 0.75)
                    .stroke(Color("customPurple") ,style: StrokeStyle(lineWidth: 13, lineCap: .round, lineJoin: .round))
                    .frame(width: 200 ,height: 200)
                    .rotationEffect(.degrees(135))
                
                VStack{
                    Image("shoeLogo")
                        .resizable()
                        .scaledToFit()
                        .clipped()
                        .frame(width: 50 ,height: 50)
                    
                    Text("\(currentSteps.formatted())")
                        .FontForegroundColorModifier(20, .bold, .default, nil, nil, .black)

                    Text("steps today")
                        .FontForegroundColorModifier(11, .bold, .default, nil, nil, .gray)
                    
                }
                
            }
            
            HStack {
                
                VStack{
                    Text("\(caloriesBurned.formatted()) cal")
                        .FontForegroundColorModifier(18, .bold, .default, nil, nil, .black)

                    Text("Cal Burned")
                        .FontForegroundColorModifier(10, .bold, .default, nil, nil, .gray)
                }
                Spacer()
                VStack{
                    Text("\(totalSteps.formatted())")
                        .FontForegroundColorModifier(18, .bold, .default, nil, nil, .black)

                    Text("Daily Goal")
                        .FontForegroundColorModifier(10, .bold, .default, nil, nil, .gray)
                }
                
            }
            .padding(.horizontal,60)
            .offset(y:10)
            
        }
        .FrameBackgroundColorModifier(330, 360, .white, 1, 10)
        .padding(.top)
        .padding(.bottom,40)
    }
    
    var buttonsView: some View {
        VStack(spacing:15){
            Button(action: {}, label: {
                Text("Share to friend")
                    .FontForegroundColorModifier(16, .semibold, .rounded, nil, nil, .white)
                    .FrameBackgroundColorModifier(270, 50, Color("customPurple"), 1, 25)
            })
            
            Button(action: {}, label: {
                Text("Not Now")
                    .FontForegroundColorModifier(16, .regular, .rounded, nil, nil, Color("customPurple"))
            })
        }
    }
    
}

struct WednesdayUIDesignView5_Previews: PreviewProvider {
    static var previews: some View {
        WednesdayUIDesignView5()
    }
}
