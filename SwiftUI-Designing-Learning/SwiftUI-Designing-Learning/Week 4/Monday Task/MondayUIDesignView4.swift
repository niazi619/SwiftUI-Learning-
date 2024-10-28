//
//  MondayUIDesignView4.swift
//  SwiftUI-Designing-Learning
//
//  Created by Apple on 28/10/2024.
//

import SwiftUI

struct MondayUIDesignView4: View {
    
    @State var toggle1: Bool = false
    @State var toggle2: Bool = false
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color.white
                    .ignoresSafeArea()
                VStack{
                    
                    VStack(spacing: 15){
                        Image("profileImage2")
                            .resizable()
                            .frame(width: 95 ,height: 95)
                        
                        Text("John Appleseed")
                            .FontForegroundColorModifier(18, .regular, .default, nil, nil, .black)
                    }
                    
                    Form{
                        
                        Section(header: sectionHeader1 ){
                            firstSectionView
                        }
                        //  .listRowInsets(EdgeInsets(top:10, leading: 0, bottom: 0, trailing: 0))
                        
                        Section(header: sectionHeader2 ){
                            secondSectionView
                        }
                        
                        Section(content: {
                            thirdSectionView
                        }, footer: {
                            sectionFooter
                        })
                        
                    }
                    .frame(width: 400)
                    Spacer()
                }
                .navigationTitle(Text("Settings"))
            }
        }
        
    }
    
    var sectionHeader1: some View {
        Text("Payment Settings")
            .FontForegroundColorModifier(12, .medium, .default, nil, nil, .gray)
            .textCase(nil)
            .offset(x:-10 ,y:-4)
    }
    
    var sectionHeader2: some View {
        Text("Personal Information")
            .FontForegroundColorModifier(12, .medium, .default, nil, nil, .gray)
            .textCase(nil)
            .offset(x:-10 ,y:-4)
    }
    
    var sectionFooter: some View {
        Text("Allow push notifications to get latest travel and equipment deals")
            .FontForegroundColorModifier(12, .medium, .default, nil, nil, .gray)
            .textCase(nil)
            .offset(x:-10)
    }
    
    var firstSectionView: some View {
        
        VStack(alignment: .leading ,spacing: 20){
            
            HStack{
                Text("Currency")
                    .FontForegroundColorModifier(16, .regular, .default, nil, nil, .black)
                
                Spacer()
                
                HStack{
                    Text("$ US Dollar")
                    
                    Image(systemName: "chevron.right")
                        .resizable()
                        .FontForegroundColorModifier(16, .regular, .default, 6, 10, .gray)
                }
                .FontForegroundColorModifier(16, .regular, .default, nil, nil, .gray)
            }
            .padding(.horizontal,5)
            
            HStack{
                Text("Payment Method")
                    .FontForegroundColorModifier(16, .regular, .default, nil, nil, .black)
                
                Spacer()
                
                HStack{
                    Text("Credit/Debit Card")
                    
                    Image(systemName: "chevron.right")
                        .resizable()
                        .FontForegroundColorModifier(16, .regular, .default,  6, 10, .gray)
                }
                .FontForegroundColorModifier(16, .regular, .default, nil, nil, .gray)
            }
            .padding(.horizontal,5)
            
            Button(action: {}, label: {
                Text("Add a Credit/Debit Card to your account")
                    .FontForegroundColorModifier(16, .regular, .default, nil, nil, .blue)
                
            })
            .padding(.horizontal,5)
            
        }
        .frame(width: 350)
    }
    
    var secondSectionView: some View {
        VStack(alignment: .leading ,spacing: 20){
           
            HStack{
                Text("Profile Information")
                    .FontForegroundColorModifier(16, .regular, .default, nil, nil, .black)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .resizable()
                    .FontForegroundColorModifier(16, .regular, .default,  6, 10, .gray)
            }
            .padding(.horizontal,5)
            
            HStack{
                Text("Billing Information")
                    .FontForegroundColorModifier(16, .regular, .default, nil, nil, .black)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .resizable()
                    .FontForegroundColorModifier(16, .regular, .default,  6, 10, .gray)
            }
            .padding(.horizontal,5)
            
        }
        .frame(width: 350)
    }
    
    var thirdSectionView: some View {
        VStack(alignment: .leading ,spacing: 20) {
            
            HStack{
                Text("Location Usage")
                    .FontForegroundColorModifier(16, .regular, .default, nil, nil, .black)
                
                Spacer()
                
                Toggle(isOn: $toggle1, label: {
                    Text("")
                })
                .scaleEffect(0.95)
                .frame(width: 65 ,height: 15)
            }
            .padding(.horizontal,5)
            
            HStack{
                Text("Notifications")
                    .FontForegroundColorModifier(16, .regular, .default, nil, nil, .black)
                
                Spacer()
                
                Toggle(isOn: $toggle2, label: {
                    Text("")
                })
                .scaleEffect(0.95)
                .frame(width: 65 ,height: 15)
            }
            .padding(.horizontal,5)
        }
        .frame(width: 350)
    }
    
}

struct MondayUIDesignView4_Previews: PreviewProvider {
    static var previews: some View {
        MondayUIDesignView4()
    }
}
