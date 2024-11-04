//
//  MondayUIDesignView5TabView.swift
//  SwiftUI-Designing-Learning
//
//  Created by Apple on 04/11/2024.
//

import SwiftUI

struct MondayUIDesignView5TabView: View {
    
    @State private var selectedTab = 0
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // Main content
            TabView(selection: $selectedTab) {
                MondayUIDesignView5()
                    .tag(0)
                Text("Saved View")
                    .tag(1)
                Text("Explore View")
                    .tag(2)
                Text("Add Event View")
                    .tag(3)
                Text("Settings View")
                    .tag(4)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .ignoresSafeArea()
            
            // Custom Tab Bar
            HStack {
//                Spacer()
                
                // Home Button
                Button(action: { selectedTab = 0 }) {
                    VStack {
                        Image(systemName: "house")
                        Text("Home")
                            .font(.caption)
                    }
                    .foregroundColor(selectedTab == 0 ? .blue : .gray)
                }
                
                Spacer()
                
                // Saved Button
                Button(action: { selectedTab = 1 }) {
                    VStack {
                        Image(systemName: "heart")
                        Text("Saved")
                            .font(.caption)
                    }
                    .foregroundColor(selectedTab == 1 ? .blue : .gray)
                }
                
                Spacer()
                
                // Center Circular Explore Button
                Button(action: { selectedTab = 2 }) {
                    VStack(spacing: 15){
                        ZStack {
                            Circle()
                                .fill(Color.white)
                                .frame(width: 70, height:70)
                                .shadow(radius: 8)
                            Circle()
                                .fill(Color.blue)
                                .frame(width: 60, height: 60)
                                .shadow(radius: 4)
                            Image(systemName: "square.grid.2x2")
                                .foregroundColor(.white)
                                .font(.system(size: 24))
                        }
                        
                        Text("Explore")
                            .font(.caption)
                    }
                    .foregroundColor(selectedTab == 2 ? .blue : .gray)
                }
                .offset(y: -35) // Lift the button slightly
                
                Spacer()
                
                // Add Event Button
                Button(action: { selectedTab = 3 }) {
                    VStack {
                        Image(systemName: "plus.app")
                        Text("Add Event")
                            .font(.caption)
                    }
                    .foregroundColor(selectedTab == 3 ? .blue : .gray)
                }
                
                Spacer()
                
                // Settings Button
                Button(action: { selectedTab = 4 }) {
                    VStack {
                        Image(systemName: "gearshape")
                        Text("Settings")
                            .font(.caption)
                    }
                    .foregroundColor(selectedTab == 4 ? .blue : .gray)
                }
                
//                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.bottom, -5)
            .background(
                Color.white
//                    .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                    .shadow(radius: 2)
            )
            
            .frame(maxWidth: .infinity)
            .shadow(radius: 30)
            .offset(y:30)
        }
    }
}

struct MondayUIDesignView5TabView_Previews: PreviewProvider {
    static var previews: some View {
        MondayUIDesignView5TabView()
    }
}


struct CustomTabBarView: View {
    @State private var selectedTab = 0

    var body: some View {
        ZStack(alignment: .bottom) {
            // Main content
            TabView(selection: $selectedTab) {
                Text("Home View")
                    .tag(0)
                Text("Saved View")
                    .tag(1)
                Text("Explore View")
                    .tag(2)
                Text("Add Event View")
                    .tag(3)
                Text("Settings View")
                    .tag(4)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            // Custom Tab Bar
            HStack {
                Spacer()
                
                // Home Button
                Button(action: { selectedTab = 0 }) {
                    VStack {
                        Image(systemName: "house")
                        Text("Home")
                            .font(.caption)
                    }
                    .foregroundColor(selectedTab == 0 ? .blue : .gray)
                }
                
                Spacer()
                
                // Saved Button
                Button(action: { selectedTab = 1 }) {
                    VStack {
                        Image(systemName: "heart")
                        Text("Saved")
                            .font(.caption)
                    }
                    .foregroundColor(selectedTab == 1 ? .blue : .gray)
                }
                
                Spacer()
                
                // Center Circular Explore Button
                Button(action: { selectedTab = 2 }) {
                    ZStack {
                        Circle()
                            .fill(Color.blue)
                            .frame(width: 60, height: 60)
                            .shadow(radius: 4)
                        Image(systemName: "square.grid.2x2")
                            .foregroundColor(.white)
                            .font(.system(size: 24))
                    }
                }
                .offset(y: -20) // Lift the button slightly
                
                Spacer()
                
                // Add Event Button
                Button(action: { selectedTab = 3 }) {
                    VStack {
                        Image(systemName: "plus.app")
                        Text("Add Event")
                            .font(.caption)
                    }
                    .foregroundColor(selectedTab == 3 ? .blue : .gray)
                }
                
                Spacer()
                
                // Settings Button
                Button(action: { selectedTab = 4 }) {
                    VStack {
                        Image(systemName: "gearshape")
                        Text("Settings")
                            .font(.caption)
                    }
                    .foregroundColor(selectedTab == 4 ? .blue : .gray)
                }
                
//                Spacer()
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 20)
            .background(
                Color.white
                    .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                    .shadow(radius: 2)
            )
            .frame(maxWidth: .infinity)
        }
    }
}

struct CustomTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBarView()
    }
}
