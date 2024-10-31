//
//  ThursdayUIDesignView4Screen2.swift
//  SwiftUI-Designing-Learning
//
//  Created by Apple on 30/10/2024.
//

import SwiftUI

struct ThursdayUIDesignView4Screen2: View {
    
    @State var selectedDate: Date = Date()
    @State var toggle: Bool = true
    @AppStorage("Data") var savedStringData: String?
    @Environment(\.presentationMode) var presentationMode
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        return formatter
    }
    
    var body: some View {
        ZStack{
            
            VStack{
                
                header
                
                ScrollView {
                    VStack(alignment: .leading ,spacing: 20) {
                        datePickerView
                        
                        VStack(alignment: .leading ,spacing: 30){
                            
                            toggleView
                            
                            viewDisplayedOnToggle
                            
                            repeatView
                            
                        }
                    }
                }
                
            }
            .padding(.horizontal,15)
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
            
            Text("Add date")
                .FontForegroundColorModifier(20, .medium, .default, nil, nil, .black)
            
            Spacer()
            
            NavigationLink {
                ThursdayUIDesignView4Screen3()
            } label: {
                Text("Next")
                    .FontForegroundColorModifier(20, .medium, .default, nil, nil, .black)
            }

            
        }
        .padding(.bottom,30)
    }
    
    var datePickerView: some View {
        VStack(alignment: .leading ,spacing: 13){
            Text("Date")
                .FontForegroundColorModifier(20, .regular, .default, nil, nil, .gray)
            
            Text(dateFormatter.string(from: selectedDate))
                .FontForegroundColorModifier(18, .regular, .default, nil, nil, .black)
            
            DatePicker("", selection: $selectedDate ,displayedComponents: .date)
                .datePickerStyle(WheelDatePickerStyle())
        }
        .padding(.horizontal,6)
    }
    
    var toggleView: some View {
        Group {
            Toggle(isOn: $toggle) {
                Text(" All Day")
                    .FontForegroundColorModifier(20, .regular, .default, nil, nil, .black)
            }
            .tint(.black)
            .scaleEffect(1.1)
            .padding(.horizontal,18)
        }
    }
    
    var viewDisplayedOnToggle: some View {
        Group {
            if toggle == false {
                Group{
                    VStack(alignment: .leading ,spacing: 8){
                        Text("Start Time")
                            .FontForegroundColorModifier(20, .regular, .default, nil, nil, .gray)
                        HStack{
                            Text("1:10 AM")
                                .FontForegroundColorModifier(20, .regular, .default, nil, nil, .black)
                            
                            Spacer()
                        }
                    }
                    .padding(.horizontal,6)
                    
                    VStack(alignment: .leading ,spacing: 8){
                        Text("End Time")
                            .FontForegroundColorModifier(20, .regular, .default, nil, nil, .gray)
                        HStack{
                            Text("11:59 PM")
                                .FontForegroundColorModifier(20, .regular, .default, nil, nil, .black)
                            
                            Spacer()
                        }
                    }
                    .padding(.horizontal,6)
                }
                .transition(.move(edge: .bottom))
                .animation(.easeOut(duration: 0.5), value: toggle)
            }
        }
    }
    
    var repeatView: some View{
        VStack(alignment: .leading ,spacing: 8){
            Text("Repeat")
                .FontForegroundColorModifier(20, .regular, .default, nil, nil, .gray)
            
            NavigationLink {
                ThursdayUIDesignView4Screen3()
            } label: {
                HStack{
//                    Text("Does not repeat")
                    Text(savedStringData ?? "")
                        .FontForegroundColorModifier(20, .regular, .default, nil, nil, .black)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .resizable()
                        .FontForegroundColorModifier(nil, .medium, .default, 11, 17, .gray)
                }
            }

            
        }
        .padding(.horizontal,6)
    }
    
}

struct ThursdayUIDesignView4Screen2_Previews: PreviewProvider {
    static var previews: some View {
        ThursdayUIDesignView4Screen2()
    }
}
