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
//            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .ignoresSafeArea()
            
            // Custom Tab Bar
            HStack {
//                Spacer()
                
                // Home Button
                Button(action: { selectedTab = 0 }) {
                    VStack(spacing: 6){
                        Image(systemName: "house")
                            .resizable()
                            .frame(width: 20 ,height: 20)
                        Text("Home")
                            .font(.caption)
                    }
                    .FontForegroundColorModifier(13, .regular, .default, 65, nil, (selectedTab == 0 ? .blue : .gray))
                    .offset(y: -5)
                }
                
                Spacer()
                
                // Saved Button
                Button(action: { selectedTab = 1 }) {
                    VStack(spacing: 6){
                        Image(systemName: "heart")
                            .resizable()
                            .frame(width: 20 ,height: 20)
                        Text("Saved")
                            .font(.caption)
                    }
                    .FontForegroundColorModifier(13, .regular, .default, 65, nil, (selectedTab == 1 ? .blue : .gray))
                    .offset(y: -5)
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
                    VStack(spacing: 6){
                        Image(systemName: "plus.app")
                            .resizable()
                            .frame(width: 20 ,height: 20)
                        Text("Add Event")
                            .font(.caption)
                    }
                    .FontForegroundColorModifier(13, .regular, .default, 65, nil, (selectedTab == 3 ? .blue : .gray))
                    .offset(y: -5)
                }
                
                Spacer()
                
                // Settings Button
                Button(action: { selectedTab = 4 }) {
                    VStack(spacing: 6){
                        Image(systemName: "gearshape")
                            .resizable()
                            .frame(width: 20 ,height: 20)
                        Text("Settings")
                            .font(.caption)
                    }
                    .FontForegroundColorModifier(13, .regular, .default, 65, nil, (selectedTab == 4 ? .blue : .gray))
                    .offset(y: -5)
                }
                
//                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.bottom, -5)
            .background(
                Color.white
//                    .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                    .clipShape(CurvedTabBarShape())
                    .shadow(color: .gray.opacity(0.3), radius: 10, x: 0, y: -25)
            )
            
            .frame(maxWidth: .infinity)
            .shadow(radius: 30)
            .offset(y:32)
        }
    }
}

struct MondayUIDesignView5TabView_Previews: PreviewProvider {
    static var previews: some View {
        MondayUIDesignView5TabView()
    }
}

// Custom Shape for the Tab Bar Curve
struct CurvedTabBarShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // Constants for curve control
        let curveHeight: CGFloat = 50
        let controlPointY: CGFloat = 25
        let transitionPointOffset: CGFloat = 20
        
        // Starting point
        path.move(to: CGPoint(x: 0, y: 0))
        
        // First smooth transition into curve
        path.addLine(to: CGPoint(x: rect.width * 0.36 - transitionPointOffset, y: 0))
        
        path.addCurve(
            to: CGPoint(x: rect.width * 0.413, y: controlPointY),
            control1: CGPoint(x: rect.width * 0.39 - transitionPointOffset/2, y: 0),
            control2: CGPoint(x: rect.width * 0.39, y: controlPointY/2)
        )
        
        // Main center curve
        path.addCurve(
            to: CGPoint(x: rect.width * 0.59, y: controlPointY),
            control1: CGPoint(x: rect.width * 0.45, y: curveHeight),
            control2: CGPoint(x: rect.width * 0.55, y: curveHeight)
        )
        
        // Second smooth transition out of curve
        path.addCurve(
            to: CGPoint(x: rect.width * 0.64 + transitionPointOffset, y: 0),
            control1: CGPoint(x: rect.width * 0.61, y: controlPointY/2),
            control2: CGPoint(x: rect.width * 0.61 + transitionPointOffset/2, y: 0)
        )
        
        // Complete the shape
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        path.addLine(to: CGPoint(x: 0, y: rect.height))
        path.closeSubpath()
        
        return path
    }
}

