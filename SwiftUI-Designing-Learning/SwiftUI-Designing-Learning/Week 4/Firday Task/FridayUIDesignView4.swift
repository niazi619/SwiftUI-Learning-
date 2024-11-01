//
//  FridayUIDesignView4.swift
//  SwiftUI-Designing-Learning
//
//  Created by Apple on 01/11/2024.
//

import SwiftUI
import MapKit

struct FridayUIDesignView4: View {
    
    @State var mapRegion: MKCoordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    @State var showlocationView: Int = 0
    @State var locationImage: String = ""
    @State var locationName: String = ""
    @State var locatedPlace: String = ""
    @State var showAnimation: Bool = false
    
    @ObservedObject var vm = FridayUIDesignViewModel4()
    
    var body: some View {
        ZStack{
            
            mapView
            
//            if showlocationView != 0 {
                VStack{
                    upperLocationView
                    
                    Spacer()
                    
                    bottomLocationCardView
                }
                .transition(.opacity)
                .padding(.vertical)
//            }
            
            
        }
    }
    
    var mapView: some View {
        
        Map(coordinateRegion: $mapRegion, annotationItems: vm.landMarksDataList){ landmark in
            MapAnnotation(coordinate: landmark.coordinate) {
                Button {
                    showlocationView = landmark.no
                    locationImage = landmark.locationImage
                    locationName = landmark.name
                    locatedPlace = landmark.located
                    showAnimation = true
                } label: {
                    Image(landmark.pinImage)
                        .resizable()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                }

            }
        }
        .ignoresSafeArea()
        .gesture(
            DragGesture().onChanged({ _ in
                showlocationView = 0
                showAnimation = false
            })
        )
    }
    
    var upperLocationView: some View {
        HStack{
            Image(systemName: "arrow.down")
                .resizable()
                .FontForegroundColorModifier(15, .medium, .default, 18, 18, .white)
            
            Spacer()
            
            Text("\(locationName)")
            
            Spacer()
        }
        .padding()
        .FontForegroundColorModifier(25, .semibold, .default, nil, nil, .white)
        .FrameBackgroundColorModifier(360, nil, .black, 0.5, 8)
        .offset(y: showlocationView != 0 ? 0 : -150)
        .animation(.easeOut(duration: 0.3), value: showAnimation)
    }
    
    var bottomLocationCardView: some View {
        HStack{
            
            VStack{
                Image("\(locationImage)")
                    .resizable()
                    .frame(width: 100 ,height: 100)
                    .scaledToFit()
                    .clipped()
                    .cornerRadius(25)
                
                Text("\(locationName)")
                    .FontForegroundColorModifier(20, .regular, .default, 130, nil, .white)
            }
            .offset(y: showlocationView != 0 ? -20 : 220)
            
            Spacer()
            
            VStack{
                Button {
                    
                } label: {
                    Text("Learn more")
                        .FontForegroundColorModifier(18, .medium, .default, nil, nil, .white)
                        .FrameBackgroundColorModifier(135, 38, .red, 1, 10)
                }
                
                Button {
                    
                } label: {
                    Text("Next")
                        .FontForegroundColorModifier(18, .medium, .default, nil, nil, .red)
                        .FrameBackgroundColorModifier(135, 38, .gray, 0.3, 10)
                }

            }
            .padding(.top,20)
            
        }
        .padding(.horizontal)
        .FrameBackgroundColorModifier(360, nil, Color("customGreen1"), 1, 8)
        .offset(y: showlocationView != 0 ? 0 : 220)
        .animation(.easeOut(duration: 0.3), value: showAnimation)
    }
    
}

struct FridayUIDesignView4_Previews: PreviewProvider {
    static var previews: some View {
        FridayUIDesignView4()
    }
}
