//
//  ThursdayUIDesignView4Screen3.swift
//  SwiftUI-Designing-Learning
//
//  Created by Apple on 31/10/2024.
//

import SwiftUI

struct OptionsDataMode: Identifiable {
    var id: String = UUID().uuidString
    var text: String
    var data: String
}

struct ThursdayUIDesignView4Screen3: View {
    
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("Checkmark") var selectedIndex: Int = 0
    @AppStorage("Data") var savedStringData: String?
    
    var optionsDataList: [OptionsDataMode] = [
        OptionsDataMode(text: "Never", data: "Does not repeat"),
        OptionsDataMode(text: "Every Week", data: "Repeats Weekly"),
        OptionsDataMode(text: "Every 2 Weeks", data: "Repeats After Every 2 Weeks"),
        OptionsDataMode(text: "Every Month", data: "Repeats Monthly"),
        OptionsDataMode(text: "Every Year", data: "Repeats Yearly")
    ]

    
    var body: some View {
        ZStack{
            
            VStack{
                
                header
                
                optionsView
                
            }
            .padding(.horizontal)
            
        }
        .navigationBarBackButtonHidden()
    }
    
    var header: some View {
        HStack{
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: "chevron.left")
                    .resizable()
                    .FontForegroundColorModifier(nil, .medium, .default, 10, 17, .black)
            }
            
            Spacer()
            
            Text("Repeat")
                .FontForegroundColorModifier(20, .medium, .default, nil, nil, .black)
            
            Spacer()
            
        }
        .padding(.bottom,40)
    }
    
    var optionsView: some View {
        ScrollView {
            VStack(spacing: 30) {
                ForEach(optionsDataList.indices) { index in
                    HStack{
                        Text(optionsDataList[index].text)
                            .FontForegroundColorModifier(20, .regular, .default, nil, nil, .black)
                        
                        Spacer()
                        
                        Image(systemName: "checkmark")
                            .resizable()
                            .FontForegroundColorModifier(20, .bold, .default, 20, 13, .black)
                            .opacity(selectedIndex == index ? 1 : 0)
                        
                    }
                    .background(Color.white)
                    .onTapGesture {
                        withAnimation {
                            selectedIndex = index
                            savedStringData = optionsDataList[index].data
                            presentationMode.wrappedValue.dismiss()
                        }
                    }
                }
            }
        }
    }
    
}

struct ThursdayUIDesignView4Screen3_Previews: PreviewProvider {
    static var previews: some View {
        ThursdayUIDesignView4Screen3()
    }
}
