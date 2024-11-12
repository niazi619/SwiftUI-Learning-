//
//  FridayUIDesignView5Screen2.swift
//  SwiftUI-Designing-Learning
//
//  Created by Apple on 11/11/2024.
//

import SwiftUI

struct FridayUIDesignView5Screen2: View {
    var body: some View {
        NavigationStack{
//            Color.white
//                .ignoresSafeArea()
            
            NavigationLink {
                FridayUIDesignView5()
            } label: {
                HStack{
                    Image("profileImage")
                        .resizable()
                        .frame(width: 50 ,height: 50)
                    
                    Text("Story")
                        .FontForegroundColorModifier(30, .bold, .rounded, nil, nil, .primary)
                    Image(systemName: "checkmark.seal.fill")
                        .foregroundColor(.blue)
                    
                    Spacer()
                    
                    Image(systemName: "arrow.right")
                }
                .padding(.horizontal,20)
            }

            
        }
    }
}

struct FridayUIDesignView5Screen2_Previews: PreviewProvider {
    static var previews: some View {
        FridayUIDesignView5Screen2()
    }
}
