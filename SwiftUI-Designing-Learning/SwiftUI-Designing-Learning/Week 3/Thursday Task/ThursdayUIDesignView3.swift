//
//  ThursdayUIDesignView3.swift
//  SwiftUI-Designing-Learning
//
//  Created by Apple on 23/10/2024.
//

import SwiftUI

struct ThursdayUIDesignView3: View {
    
    @State var index: Int = 0
    
    @ObservedObject var vm = ThursdayUIDesignViewModel3()
    
    var body: some View {
        
        ZStack{
            
            Color("customBlue")
                .ignoresSafeArea()
            
            Image("collectionBackground")
                .resizable()
                .scaledToFill()
                .frame(width: 450 ,height: 220)
                .clipShape(RoundedRectangle(cornerRadius: 60))
                .offset(x:28 ,y:-350)
            
            
            VStack(alignment: .leading){
                
                profileImageView
                    .offset(y:-20)
                
                VStack(alignment: .leading, spacing: 13) {
                    
                    profileNameAndTextView
                    
                    followAndMessageView
                    
                    collectionAndPostsView
                    
                    picturesScrollView
                }
                .padding(.horizontal)
                .offset(y:-40)
                
                
            }
            .padding(.horizontal)
            .frame(width: 400 )
            .offset(y:50)
            
        }
    }
    
    var profileImageView: some View {
        
        Group{
            Image(systemName: "chevron.left.circle.fill")
                .resizable()
                .FontForegroundColorModifier(nil, .regular, .default, 30, 30, .gray)
                .padding(.horizontal)
            
            HStack{
                
                Spacer()
                
                Image("proflieImage")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100 ,height: 100)
                    .cornerRadius(50)
                    .overlay(Circle()
                        .stroke(Color("customDarkCyan") ,lineWidth: 2)
                        .shadow(color: Color("customDarkCyan"), radius: 5 ,x: 0 ,y: 6)
                        .frame(width: 115 ,height: 115)
                        )
            }
            .padding(.trailing,30)
        }
    }
    
    var profileNameAndTextView: some View {
        Group{
            HStack(spacing: 13){
                
                Text("John")
                    .FontForegroundColorModifier(31, .heavy, .default, nil, nil, .white)
                    .tracking(2)
                
                Image(systemName: "checkmark.seal")
                    .FontForegroundColorModifier(20, .bold, .default, nil, nil, Color("customDarkCyan"))
                
            }
            
            Text("@aaalex")
                .FontForegroundColorModifier(17, .medium, .default, nil, nil, .white)
            
            VStack(alignment: .leading) {
                Text("Lorem ipsum dolor sit amet,")
                Text("consectetur adipiscing elit. In vitae ex")
            }
            .FontForegroundColorModifier(15, .regular, .default, nil, nil, .white)
        }
    }
    
    var followAndMessageView: some View {
        HStack(spacing: 15){
            
            Button(action: {}, label: {
                Text("Follow")
                    .FontForegroundColorModifier(16, .medium, .rounded, 160, 45, Color("customDarkCyan"))
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("customDarkCyan"),lineWidth: 2))
            })
            
            Button(action: {}, label: {
                Text("Message")
                    .FontForegroundColorModifier(16, .medium, .rounded, 160, 45, .white )
                    .FrameBackgroundColorModifier(160, 45, Color("customDarkCyan"), 1, 10)
            })
            
        }
    }
    
    var collectionAndPostsView: some View {
        HStack{
            VStack(spacing: 5){
                
                Text("Collection")
                    .FontForegroundColorModifier(16, index == 0 ? .bold : .medium, .rounded, 160, nil, index == 0 ? Color("customDarkCyan") : .gray)
                    .onTapGesture {
                        withAnimation(.easeIn){
                            index = 0
                        }
                    }
                Capsule().fill(index == 0 ? Color("customDarkCyan") : Color("customBlue"))
                    .frame(width: 90 ,height: 1)
            }
            
            VStack(spacing: 5){
                
                Text("Posts")
                    .FontForegroundColorModifier(16, index == 1 ? .bold : .medium, .rounded, 160, nil, index == 1 ? Color("customDarkCyan") : .gray)
                    .onTapGesture {
                        withAnimation(.easeIn){
                            index = 1
                        }
                    }
                Capsule().fill(index == 1 ? Color("customDarkCyan") : Color("customBlue"))
                    .frame(width: 90 ,height: 1)
            }
            
        }
        .padding(.top,30)
        .padding(.bottom,5)

    }
    
    var picturesScrollView: some View {
        ScrollView {
            
            HStack(spacing: 10){
                
                VStack(spacing: 10){
                    ForEach(vm.imagesDataList.indices) { index in
                        
                        Image(vm.imagesDataList[index])
                            .resizable()
                            .scaledToFill()
                            .frame(width: 160, height: index == 0 ? 100 : 200)
                            .cornerRadius(8)
                            .clipped()
                        
                    }
                }
                .offset(y:-45)
                
                VStack(spacing: 10){
                    ForEach(vm.imagesDataList2.indices) { index in
                        
                        Image(vm.imagesDataList2[index])
                            .resizable()
                            .scaledToFill()
                            .frame(width: 160, height: 200)
                            .cornerRadius(8)
                            .clipped()
                        
                    }
                }
                
            }
            
        }
    }
    
}

struct ThursdayUIDesignView3_Previews: PreviewProvider {
    static var previews: some View {
        ThursdayUIDesignView3()
    }
}
