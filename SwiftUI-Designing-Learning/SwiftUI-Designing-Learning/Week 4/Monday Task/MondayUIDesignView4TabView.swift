//
//  MondayUIDesignView4TabView.swift
//  SwiftUI-Designing-Learning
//
//  Created by Apple on 28/10/2024.
//

import SwiftUI

struct MondayUIDesignView4TabView: View {
    var body: some View {
        TabView {
            
            MondayUIDesignView4()
                .tabItem{
                    Image(systemName: "bicycle")
                    Text("Actvities")
                }
            
            MondayUIDesignView4()
                .tabItem{
                    Image(systemName: "cart")
                    Text("Cart")
                }
            
            MondayUIDesignView4()
                .tabItem{
                    Image(systemName: "person")
                    Text("Account")
                }
        }
        .accentColor(.blue)
        
    }
}

struct MondayUIDesignView4TabView_Previews: PreviewProvider {
    static var previews: some View {
        MondayUIDesignView4TabView()
    }
}
