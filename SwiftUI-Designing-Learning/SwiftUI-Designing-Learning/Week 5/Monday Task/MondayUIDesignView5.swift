//
//  MondayUIDesignView5.swift
//  SwiftUI-Designing-Learning
//
//  Created by Apple on 04/11/2024.
//

import SwiftUI

struct MondayUIDesignView5: View {
    
    @State var search: String = ""
    @State var horizantalTab: Int = 0
    
    @ObservedObject var vm = MondayUIDesignViewModel5()
    
    var body: some View {
        ZStack{
            Image("cyanBackground")
                .resizable()
                .frame(width: 400 ,height: 760)
                .scaledToFill()
                .offset(y:-100)
                .ignoresSafeArea()
            
            RoundedRectangle(cornerRadius: 30).fill(Color.white)
                .frame(width: 400 ,height: 700)
                .offset(y:130)
                .ignoresSafeArea()
            
            VStack {
                
                header
                searchTextField
                
                Spacer()
                
                ScrollView{
                    horizantalTabBar
                    ongoingEventsView
                    upcomingEventsView
                }
                .padding(.top,10)
            }
            .frame(width: 400)
            
        }
    }
    
    var header: some View {
        
        HStack{
            
            HStack{
                Image("locationLogo")
                    .resizable()
                    .frame(width: 25 ,height: 25)
                
                VStack(alignment: .leading){
                    Text("My Location")
                        .FontForegroundColorModifier(15, .regular, .default, nil, nil, .gray)
                    Text("12 St.,New York")
                        .FontForegroundColorModifier(17, .bold, .default, nil, nil, Color("customBlue"))
                }
            }
            
            Spacer()
            
            HStack {
                Image(systemName: "bell.fill")
                    .resizable()
                    .FontForegroundColorModifier(20, .regular, .default, 17, 20, .cyan)
                    .FrameBackgroundColorModifier(40, 40, .white, 1, 10)
                    .overlay {RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.cyan,lineWidth: 2)}
                
                Image("profileImage1")
                    .resizable()
                    .scaledToFit()
                    .clipped()
                    .frame(width: 40 ,height: 40)
                    .cornerRadius(10)
                
            }
            
        }
        .padding(.vertical)
        .padding(.horizontal,25)
        .padding(.bottom,8)
    }
    
    var searchTextField: some View {
        HStack{
            
            Image(systemName: "magnifyingglass")
                .resizable()
                .FontForegroundColorModifier(18, .light, .default, 20, 20, .gray)
            
            TextField("Search", text: $search)
                .FontForegroundColorModifier(18, .regular, .default, nil, nil, .gray)
            
        }
        .padding(.vertical)
        .padding(.horizontal,25)
        .FrameBackgroundColorModifier(350, 50, .white, 1, 10)
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray,lineWidth: 1))
        
    }
    
    var horizantalTabBar: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 15) {
                
//                Spacer()
                Text("🎤 Music")
                    .padding(.vertical,12)
                    .padding(.horizontal,20)
                    .FontForegroundColorModifier(18, horizantalTab == 0 ? .regular : .light, .default, nil, nil, horizantalTab == 0 ? .white : Color("customBlue"))
                    .FrameBackgroundColorModifier(nil, nil, horizantalTab == 0 ? Color("customBlue") : Color.white, 1, 10)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color("customBlue"),lineWidth: 1.5))
                    .onTapGesture {
                        withAnimation {
                            horizantalTab = 0
                        }
                    }
                
                Text("🎭 Visual Art")
                    .padding(.vertical,12)
                    .padding(.horizontal,20)
                    .FontForegroundColorModifier(18, horizantalTab == 1 ? .regular : .light, .default, nil, nil, horizantalTab == 1 ? .white : Color("customBlue"))
                    .FrameBackgroundColorModifier(nil, nil, horizantalTab == 1 ? Color("customBlue") : Color.white, 1, 10)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color("customBlue"),lineWidth: 1.5))
                    .onTapGesture {
                        withAnimation {
                            horizantalTab = 1
                        }
                    }
                
                Text("🏖 Holiday")
                    .padding(.vertical,12)
                    .padding(.horizontal,20)
                    .FontForegroundColorModifier(18, horizantalTab == 2 ? .regular : .light, .default, nil, nil, horizantalTab == 2 ? .white : Color("customBlue"))
                    .FrameBackgroundColorModifier(nil, nil, horizantalTab == 2 ? Color("customBlue") : Color.white, 1, 10)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color("customBlue"),lineWidth: 1.5))
                    .onTapGesture {
                        withAnimation {
                            horizantalTab = 2
                        }
                    }
//                Spacer()
                
            }
            .padding(.horizontal,25)
            .padding(.vertical,25)
        }
        .scrollIndicators(.hidden)
    }
    
    var ongoingEventsView: some View {
        VStack{
            HStack{
                Text("Ongoing Events")
                    .FontForegroundColorModifier(18, .semibold, .default, nil, nil, Color.black)
                
                Spacer()
                
                Button(action: {}, label: {
                    Text("View All")
                        .FontForegroundColorModifier(15, .semibold, .default, nil, nil, Color.blue)
                })
            }
            .padding(.horizontal,25)
            
            ScrollView(.horizontal) {
                HStack{
                    
                    ForEach(vm.ongoingEventsDataList.indices) { index in
                        HStack{
                            ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
                                Image(vm.ongoingEventsDataList[index])
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 105 ,height: 150)
                                    .clipped()
                                
                                Image(systemName: "heart.square")
                                    .resizable()
                                    .FontForegroundColorModifier(20, .light, .default, 25, 25, .gray)
                                    .offset(x:9,y:9)
                            }
                            
                            VStack(alignment: .leading,spacing: 10){
                                
                                HStack{
                                    Text("Neon Party")
                                        .FontForegroundColorModifier(15, .semibold, .default, nil, nil, Color.blue)
                                    
                                    Spacer()
                                    
                                    Text("The Groove")
                                        .FontForegroundColorModifier(12, .semibold, .default, nil, nil, Color("customGray"))
                                }
                                HStack{
                                    Text("Ends in 30 Mins.")
                                        .FontForegroundColorModifier(12, .semibold, .default, nil, nil, Color("customGray"))
                                    
                                    Spacer()
                                    
                                    Text("0.5 miles")
                                        .FontForegroundColorModifier(12, .semibold, .default, nil, nil, Color("customGray"))
                                }
                                Spacer()
                                HStack {
                                    Text("Join the ultimate glow party featuring  neon lights,body paint,and high-energy beats. A vibrant, unforgettable night.")
                                        .FontForegroundColorModifier(10, .regular, .default, 200, nil, Color.gray)
                                        .multilineTextAlignment(.leading)
                                        .offset(x:-5,y:-20)
                                    
                                    Image(systemName: "questionmark.bubble")
                                        .resizable()
                                        .FontForegroundColorModifier(20, .light, .default, 25, 25, .cyan)
                                        .offset(x:-7,y:12)
                                }
                                
                            }
                            .padding(.vertical)
                            .padding(.horizontal,5)
                        }
                        .frame(width: 350 ,height: 150)
                        .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                        
                    }
                    
                }
                .padding(.horizontal,25)
            }
            .scrollIndicators(.hidden)
        }
        .padding(.bottom,25)
    }
    
    var upcomingEventsView: some View {
        VStack{
            HStack{
                Text("Upcoming Events")
                    .FontForegroundColorModifier(18, .semibold, .default, nil, nil, Color.black)
                
                Spacer()
                
                Button(action: {}, label: {
                    Text("View All")
                        .FontForegroundColorModifier(15, .semibold, .default, nil, nil, Color.blue)
                })
            }
            .padding(.horizontal,25)
            
            ScrollView(.horizontal) {
                HStack{
                    
                    ForEach(vm.uploadingEventsDataList.indices) { index in
                        
                        ZStack{
                            Image(vm.uploadingEventsDataList[index])
                                .resizable()
                                .scaledToFill()
                                .clipped()
                                .frame(width: 320 ,height: 200)
                                .cornerRadius(10)
                            
                            VStack{
                                HStack{
                                    Text("Music")
                                        .padding(.horizontal)
                                        .padding(.vertical,8)
                                        .FontForegroundColorModifier(12, .light, .default, nil, nil, .white)
                                        .FrameBackgroundColorModifier(nil, nil, .black, 0.5, 10)
                                    
                                    Spacer()
                                    
                                    Image(systemName: "heart.fill")
                                        .resizable()
                                        .FontForegroundColorModifier(12, .light, .default, 15, 15, .white)
                                        .FrameBackgroundColorModifier(30, 30, .black, 0.5, 5)
                                }
                                
                                Spacer()
                                
                                VStack{
                                    
                                    HStack{
                                        Text("Daytime Disco")
                                            .FontForegroundColorModifier(12, .medium, .default, nil, nil, .white)
                                        Spacer()
                                        Image(systemName: "questionmark.bubble")
                                            .resizable()
                                            .FontForegroundColorModifier(20, .light, .default, 15, 15, .white)
                                            .FrameBackgroundColorModifier(30, 30, .black, 0.5, 5)
                                    }
                                    
                                    Spacer()
                                    
                                    HStack{
                                        Text("June 22, 2024 to June 26, 2024")
                                            .FontForegroundColorModifier(12, .light, .default, nil, nil, .white)
                                        Spacer()
                                        Text("The Loft")
                                            .FontForegroundColorModifier(12, .light, .default, nil, nil, .white)
                                    }
                                }
                                .padding(.horizontal)
                                .padding(.vertical,8)
                                .FrameBackgroundColorModifier(nil, 60, .black, 0.5, 10)
                            }
                            .padding(10)
                        }
                        .frame(width: 320 ,height: 200)
                    }
                    
                }
                .padding(.horizontal,25)
            }
            .scrollIndicators(.hidden)
        }
        .padding(.bottom,40)
    }
    
}

struct MondayUIDesignView5_Previews: PreviewProvider {
    static var previews: some View {
        MondayUIDesignView5()
    }
}

