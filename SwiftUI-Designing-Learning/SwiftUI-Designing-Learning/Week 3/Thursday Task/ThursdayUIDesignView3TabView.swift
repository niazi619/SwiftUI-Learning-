//
//  ThursdayUIDesignView3TabView.swift
//  SwiftUI-Designing-Learning
//
//  Created by Apple on 24/10/2024.
//

import SwiftUI

struct ThursdayUIDesignView3TabView: View {
    var body: some View {
        
        TabView {
            
            Group{
                CradsView()
                    .tabItem{
                        Image(systemName: "greetingcard.fill")
                        Text("My Cards")
                    }
                
                CollectionView()
                    .tabItem{
                        Image(systemName: "giftcard")
                        Text("Collection")
                    }
                
                MarletplaceView()
                    .tabItem{
                        Image(systemName: "house.lodge")
                        Text("Marketplace")
                    }
                
                ChatView()
                    .tabItem{
                        Image(systemName: "ellipsis.message.fill")
                        Text("Chat")
                    }
                
                ThursdayUIDesignView3()
                    .tabItem{
                        Image(systemName: "square.grid.2x2.fill")
                        Text("Dilly Live")
                    }
            }
//            .toolbarBackground(.visible, for: .tabBar)
            .toolbarBackground(Color("customBlue2"), for: .tabBar)
            
        }
        .accentColor(Color("customDarkCyan"))
        
        
    }
}

struct ThursdayUIDesignView3TabView_Previews: PreviewProvider {
    static var previews: some View {
        ThursdayUIDesignView3TabView()
    }
}


struct CradsView: View{
    var body: some View {
        
        VStack{
            Text("My Cards")
                .FontForegroundColorModifier(30, .heavy, .default, nil, nil, .black)
        }
        
    }
}

struct CollectionView: View{
    var body: some View {
        
        VStack{
            Text("Collection")
                .FontForegroundColorModifier(30, .heavy, .default, nil, nil, .black)
        }
        
    }
}


struct MarletplaceView: View{
    var body: some View {
        
        VStack{
            Text("MarletPlace")
                .FontForegroundColorModifier(30, .heavy, .default, nil, nil, .black)
        }
        
    }
}

struct ChatView: View{
    var body: some View {
        
        VStack{
            Text("Chat")
                .FontForegroundColorModifier(30, .heavy, .default, nil, nil, .black)
        }
        
    }
}
