//
//  Practics Gesture.swift
//  SwiftUI-Designing-Learning
//
//  Created by Apple on 12/11/2024.
//

import SwiftUI

struct Practics_Gesture: View {
    
    @State var offset: CGSize = .zero
    
    var body: some View {
        ZStack{
            Color.white
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 35){
                
                Image("profileImage1")
                    .resizable()
                    .frame(width: 120, height: 120)
                    .cornerRadius(15)
                
                VStack(alignment: .leading ,spacing: 30){
                    VStack(alignment: .leading,spacing: 10) {
                        Text("Name :")
                            .FontForegroundColorModifier(20, .bold, .rounded, nil, nil, .black)
                        Text("Muhammad Ibrahim")
                            .FontForegroundColorModifier(18, .regular, .default, nil, nil, .white)
                    }
                    
                    VStack(alignment: .leading,spacing: 10) {
                        Text("Email :")
                            .FontForegroundColorModifier(20, .bold, .rounded, nil, nil, .black)
                        Text("Ibrahim@ gmail.com")
                            .FontForegroundColorModifier(18, .regular, .default, nil, nil, .white)
                    }
                }
                .frame(width: 220 ,height: 200 ,alignment: .leading)
                
            }
            .frame(width: 300 ,height: 500)
            .background(
                RoundedRectangle(cornerRadius: 15).fill(
                    LinearGradient(
                        gradient: Gradient(colors: [Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)),Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1))]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing)
                )
                    .frame(width: 300 ,height: 500)
                    .shadow(color: .purple, radius: 15 ,x: 10 ,y: 10)
            )
            .offset(offset)
            .gesture(
                DragGesture()
                    .onChanged({ value in
                        withAnimation(.linear(duration: 0.3)){
                            offset = value.translation
                        }
                    })
                    .onEnded({ value in
                        withAnimation(.linear(duration: 0.3)){
                            offset = .zero
                        }
                    })
            )
            
        }
    }
}

struct Practics_Gesture_Previews: PreviewProvider {
    static var previews: some View {
        Practics_Gesture()
    }
}
