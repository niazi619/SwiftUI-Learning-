//
//  TuesdayUIDesignView3TabView.swift
//  SwiftUI-Designing-Learning
//
//  Created by Apple on 22/10/2024.
//

import SwiftUI

struct TuesdayUIDesignView3TabView: View {
    var body: some View {
        ZStack{
            TabView{
                
                Group{
                    TuesdayUIDesignView3()
                        .tabItem{
                            Image(systemName: "house")
                        }
                    
                    Profile2View()
                        .tabItem{
                            Image(systemName: "person.2")
                        }
                    
                    AddView()
                        .tabItem{
                            Image(systemName: "plus.circle")
                        }
                    
                    HeartView()
                        .tabItem{
                            Image(systemName: "heart")
                        }
                    
                    SettingsView()
                        .tabItem{
                            Image(systemName: "gearshape")
                        }
                }
                .toolbarBackground(.visible, for: .tabBar)
                .toolbarBackground(.white, for: .tabBar)
            }
            .accentColor(.pink)
            
        }
        
    }
}

struct TuesdayUIDesignView3TabView_Previews: PreviewProvider {
    static var previews: some View {
        TuesdayUIDesignView3TabView()
    }
}

struct Profile2View: View{
    var body: some View {
        
        VStack{
            Text("Profile")
                .FontForegroundColorModifier(30, .heavy, .default, nil, nil, .black)
        }
        
    }
}

struct AddView: View{
    var body: some View {
        
        VStack{
            Text("Add")
                .FontForegroundColorModifier(30, .heavy, .default, nil, nil, .black)
        }
        
    }
}

struct HeartView: View{
    var body: some View {
        
        VStack{
            Text("TattoArt")
                .FontForegroundColorModifier(30, .heavy, .default, nil, nil, .black)
        }
        
    }
}


struct SettingsView: View{
    var body: some View {
        
        VStack{
            Text("Resources")
                .FontForegroundColorModifier(30, .heavy, .default, nil, nil, .black)
        }
        
    }
}


