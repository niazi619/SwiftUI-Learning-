//
//  WednesdayUIDesignView2TabView.swift
//  SwiftUI-Designing-Learning
//
//  Created by Apple on 16/10/2024.
//

import SwiftUI

struct WednesdayUIDesignView2TabView: View {
    var body: some View {
        
        ZStack{
            
//            Color.black.ignoresSafeArea()
            
            TabView {
                Group{
                    WednesdayUIDesignView2()
                        .tabItem{
                            Image(systemName: "target")
                            Text("Create")
                        }
                    
                    ExploreView()
                        .tabItem{
                            Image(systemName: "square.grid.2x2.fill")
                            Text("Explore")
                        }
                    
                    TattoArtView()
                        .tabItem{
                            Image(systemName: "pencil")
                            Text("Tattoo Art")
                        }
                    
                    ResourcesView()
                        .tabItem{
                            Image(systemName: "doc.text.magnifyingglass")
                            Text("Resources")
                        }
                    
                    ProfileView()
                        .tabItem{
                            Image(systemName: "person")
                            Text("Profile")
                        }
                }
                .toolbarBackground(.black, for: .tabBar)
                //.toolbarBackground(.visible, for: .tabBar)
            }
            .colorScheme(.dark)
            .accentColor(.orange)
            
            
            
        }
        
        
    }
}

struct WednesdayUIDesignView2TabView_Previews: PreviewProvider {
    static var previews: some View {
        WednesdayUIDesignView2TabView()
    }
}

struct ExploreView: View{
    var body: some View {
        
        VStack{
            Text("Explore")
                .FontForegroundColorModifier(30, .heavy, .default, nil, nil, .white)
        }
        
    }
}

struct TattoArtView: View{
    var body: some View {
        
        VStack{
            Text("TattoArt")
                .FontForegroundColorModifier(30, .heavy, .default, nil, nil, .white)
        }
        
    }
}


struct ResourcesView: View{
    var body: some View {
        
        VStack{
            Text("Resources")
                .FontForegroundColorModifier(30, .heavy, .default, nil, nil, .white)
        }
        
    }
}

struct ProfileView: View{
    var body: some View {
        
        VStack{
            Text("Profile")
                .FontForegroundColorModifier(30, .heavy, .default, nil, nil, .white)
        }
        
    }
}
