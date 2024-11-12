//
//  WednesdayAndThursdayUIDesignTaskTabBarView.swift
//  SwiftUI-Designing-Learning
//
//  Created by Apple on 07/11/2024.
//

import SwiftUI

struct WednesdayAndThursdayUIDesignTaskTabBarView: View {
    
    @State var selectedView: Int = 0
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            TabView(selection: $selectedView) {
                WednesdayUIDesignView5()
                    .tag(0)
                Text("MIC")
                    .tag(1)
                Text("Add View")
                    .tag(2)
                Text("More Options")
                    .tag(3)
                ThursdayUIDesignView5()
                    .tag(4)
            }
            
            customTabBar
            
        }
    }
    
    var customTabBar: some View {
        // Custom Tab Bar
        HStack(spacing: 20){
            
            Button(action: {
                selectedView = 0
            }, label: {
                Image(systemName: "house.fill")
                    .resizable()
                    .FontForegroundColorModifier(20, .regular, .default, 20, 20, selectedView == 0 ? .black : .gray)
            })
            .frame(width: 55,height: 55)
            .offset(y:-10)
            
            Button(action: {
                selectedView = 1
            }, label: {
                Image(systemName: "mic.fill")
                    .resizable()
                    .FontForegroundColorModifier(20, .regular, .default, 18, 20, selectedView == 1 ? .black : .gray)
            })
            .frame(width: 55,height: 55)
            .offset(y:-10)
            
            Button(action: {
                selectedView = 2
            }, label: {
                Image(systemName: "plus")
                    .resizable()
                    .FontForegroundColorModifier(20, .regular, .default, 20, 20, selectedView == 2 ? .black : .white)
                    .FrameBackgroundColorModifier(60, 60, Color("customPurple2"), 1, 50)
                    .clipShape(Circle())
            })
            .frame(width: 55,height: 55)
            .offset(y:-40)
            
            Button(action: {
                selectedView = 3
            }, label: {
                Image(systemName: "line.3.horizontal")
                    .resizable()
                    .FontForegroundColorModifier(20, .regular, .default, 20, 20, selectedView == 3 ? .black : .gray)
            })
            .frame(width: 55,height: 55)
            .offset(y:-10)
            
            Button(action: {
                selectedView = 4
            }, label: {
                Image(systemName: "person.fill")
                    .resizable()
                    .FontForegroundColorModifier(20, .regular, .default, 20, 20, selectedView == 4 ? .black : .gray)
            })
            .frame(width: 55,height: 55)
            .offset(y:-10)
            
        }
        .frame(maxWidth: .infinity)
        .frame(height: 90)
        .background {
            Color.white
                .clipShape(CurvedTabBarShape2())
        }
        .shadow(radius: 2)
        .offset(y:40)
    }
    
}

struct WednesdayAndThursdayUIDesignTaskTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        WednesdayAndThursdayUIDesignTaskTabBarView()
    }
}

struct CurvedTabBarShape2: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // Constants for curve control
        let curveHeight: CGFloat = 55
        let controlPointY: CGFloat = 25
        let transitionPointOffset: CGFloat = 20
        
        // Starting point
        path.move(to: CGPoint(x: 0, y: 0))
        
        // First smooth transition into curve
        path.addLine(to: CGPoint(x: rect.width * 0.44 - transitionPointOffset, y: 0))
        
        path.addCurve(
            to: CGPoint(x: rect.width * 0.413, y: controlPointY),
            control1: CGPoint(x: rect.width * 0.43 - transitionPointOffset/2, y: 0),
            control2: CGPoint(x: rect.width * 0.40, y: controlPointY/2)
        )
        
        // Main center curve
        path.addCurve(
            to: CGPoint(x: rect.width * 0.585, y: controlPointY),
            control1: CGPoint(x: rect.width * 0.45, y: curveHeight),
            control2: CGPoint(x: rect.width * 0.56, y: curveHeight)
        )
        
        // Second smooth transition out of curve
        path.addCurve(
            to: CGPoint(x: rect.width * 0.55 + transitionPointOffset, y: 0),
            control1: CGPoint(x: rect.width * 0.60, y: controlPointY/2),
            control2: CGPoint(x: rect.width * 0.57 + transitionPointOffset/2, y: 0)
        )
        
        // Complete the shape
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        path.addLine(to: CGPoint(x: 0, y: rect.height))
        path.closeSubpath()
        
        return path
    }
}
