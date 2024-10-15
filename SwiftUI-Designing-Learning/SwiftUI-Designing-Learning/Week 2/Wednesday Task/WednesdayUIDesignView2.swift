//
//  WednesdayUIDesignView2.swift
//  SwiftUI-Designing-Learning
//
//  Created by Apple on 15/10/2024.
//

import SwiftUI

struct WednesdayUIDesignView2: View {
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            VStack{
                
                HStack{
                    Spacer()
                    Text("PRO")
                        .FontForegroundColorModifier(22, .medium, .default, nil, nil, .black)
                        .FrameBackgroundColorModifier(100, 50, .yellow, 1, 25)
                }
                
                VStack(alignment: .leading) {
                    Text("Styles(Optional)")
                        .FontForegroundColorModifier(22, .medium, .default, nil, nil, .white)
                    
                    ScrollView(.horizontal){
                        
                        HStack(spacing: 15) {
                            
                        }
                        
                    }
                    
                }
                
                
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
