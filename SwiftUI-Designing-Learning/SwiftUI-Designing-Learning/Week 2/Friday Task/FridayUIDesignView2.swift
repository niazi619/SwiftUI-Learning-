//
//  FridayUIDesignView2.swift
//  SwiftUI-Designing-Learning
//
//  Created by Apple on 18/10/2024.
//

import SwiftUI
import MapKit

struct Landmark:Identifiable {
    
    var id: String = UUID().uuidString
    var name: String
    var coordinate: CLLocationCoordinate2D
    var imageName: String
}

struct FridayUIDesignView2: View {
    
    @State var showSideMenu: Bool = false
    let dragMenu: CGFloat = 130
    @State var index: Int = 1
    @State var mapRegion: MKCoordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    
    
    let landMarks: [Landmark] = [
        Landmark(name: "Golden Gate Bridge", coordinate: CLLocationCoordinate2D(latitude: 37.8199, longitude: -122.4783), imageName: "locationLogo"),
        Landmark(name: "Alcatraz Island", coordinate: CLLocationCoordinate2D(latitude: 37.8267, longitude: -122.4230), imageName: "locationLogo")
    ]
    
    var body: some View {
        
        ZStack{
            
            Map(coordinateRegion: $mapRegion ,annotationItems: landMarks){ landmark in
                MapAnnotation(coordinate: landmark.coordinate) {
                    Image(landmark.imageName)
                        .resizable()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                }
            }
            .opacity(showSideMenu == true ? 0.3 : 1)
            .ignoresSafeArea()
            
            VStack{
                
                ZStack{
                    Color.white
                        .frame(width: 400 ,height: 150)
                        .offset(y:-60)
                        .shadow(radius: 100 ,y: 100)
                    
                    searchAndAreas
                }
                                
                Spacer()
                
                textAndButtonsView
                
            }
            .opacity(showSideMenu == true ? 0.3 : 1)
            
            SideMenuView()
                .offset(x: showSideMenu == true ? 0 : -286)
                .gesture(
                    DragGesture()
                        .onEnded({ value in
                            let gestureMenuShow = value.translation.width > self.dragMenu
                            withAnimation(){
                                showSideMenu = gestureMenuShow
                            }
                        })
                )
            
            
        }
        
    }
    
    var searchAndAreas: some View {
        VStack{
            HStack(spacing: 80) {
                Button(action: {
                    
                    withAnimation(){
                        showSideMenu =  true
                    }
                    
                }, label: {
                    Image(systemName: "line.3.horizontal")
                        .resizable()
                        .FontForegroundColorModifier(22, .light, .default, 25, 18, .black)
                })
                
                Text("Search Results")
                    .FontForegroundColorModifier(18, .medium, .default, nil, nil, .black)
                
                Button(action: {}, label: {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .FontForegroundColorModifier(22, .medium, .default, 20, 20, .black)
                })
            }
            .padding(.bottom)
            .FrameBackgroundColorModifier(400, 30, .white, 1, 0)
            
            
            Rectangle().fill(Color("customGray"))
                .frame(width: 400 , height: 0.5)
            
            HStack(spacing: 0) {
                Text("Gyms")
                    .FontForegroundColorModifier(18, .semibold, .default, nil, nil, index == 0 ? .white : .black)
                    .FrameBackgroundColorModifier(200, 70, index == 0 ? Color("customGray") : .white, 1, 0)
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.5)){
                            index = 0
                        }
                    }
                
                Text("Pools")
                    .FontForegroundColorModifier(18, .semibold, .default, nil, nil, index == 1 ? .white : .black)
                    .FrameBackgroundColorModifier(200, 70, index == 1 ? Color("customGray") : .white, 1, 0)
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.5)){
                            index = 1
                        }
                    }
            }
            .FrameBackgroundColorModifier(400, 55, .white, 1, 0)
            
        }
    }
    
    var textAndButtonsView: some View {
        VStack(spacing: 10) {
            Text("Please enable location so we can show gyms close to you automatically")
                .multilineTextAlignment(.center)
                .FontForegroundColorModifier(15, .medium, .default, nil, nil, .black)
                .FrameBackgroundColorModifier(350, 70, .white, 1, 10)
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(
                        Color("customGray"),
                        lineWidth: 1
                    ))
                .padding()
                .shadow(radius: 10)
            
            HStack(spacing: 11){
                
                Button(action: {}, label: {
                    Text("Filter")
                        .FontForegroundColorModifier(14, .semibold, .default, 60, 60, .black)
                        .FrameBackgroundColorModifier(nil, nil, .white, 1, 40)
                        .overlay(RoundedRectangle(cornerRadius: 40)
                            .stroke(
                                Color("customGray"),
                                lineWidth: 1
                            ))
                        .shadow(radius: 10)
                })
                
                Button(action: {}, label: {
                    Text("List")
                        .FontForegroundColorModifier(14, .semibold, .default, 60, 60, .black)
                        .FrameBackgroundColorModifier(nil, nil, .white, 1, 40)
                        .overlay(RoundedRectangle(cornerRadius: 40)
                            .stroke(
                                Color("customGray"),
                                lineWidth: 1
                            ))
                        .shadow(radius: 10)
                })
                
                Spacer()
                
                Button(action: {}, label: {
                    HStack{
                        Text("Enable location")
                        
                        Image("crosshair")
                            .resizable()
                            .frame(width: 25 ,height: 25)
                    }
                    .FontForegroundColorModifier(14, .regular, .default, nil, nil, .black)
                    .FrameBackgroundColorModifier(165, 60, .white, 1, 40)
                    .overlay(RoundedRectangle(cornerRadius: 40)
                        .stroke(
                            Color("customGray"),
                            lineWidth: 1
                        ))
                    .shadow(radius: 10)
                })
                
            }
            .padding(.horizontal)
            
        }
        .padding()
    }
    
}

struct FridayUIDesignView2_Previews: PreviewProvider {
    static var previews: some View {
        FridayUIDesignView2()
    }
}
