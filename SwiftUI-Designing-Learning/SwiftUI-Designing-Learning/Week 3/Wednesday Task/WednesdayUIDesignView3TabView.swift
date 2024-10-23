//
//  WednesdayUIDesignView3TabView.swift
//  SwiftUI-Designing-Learning
//
//  Created by Apple on 23/10/2024.
//

import SwiftUI

struct WednesdayUIDesignView3TabView: View {
    var body: some View {
        TabView{
            
            WednesdayUIDesignView3()
                .tabItem{
                    Image(systemName: "film")
                    Text("Movies")
                }
            
            ResourcesView()
                .tabItem{
                    Image(systemName: "square.stack")
                    Text("Discover")
                }
            
            TattoArtView()
                .tabItem{
                    Image(systemName: "heart.circle")
                    Text("My lists")
                }
            
        }
        .accentColor(.yellow)
        .colorScheme(.dark)
        
    }
}

struct WednesdayUIDesignView3TabView_Previews: PreviewProvider {
    static var previews: some View {
        WednesdayUIDesignView3TabView()
    }
}
