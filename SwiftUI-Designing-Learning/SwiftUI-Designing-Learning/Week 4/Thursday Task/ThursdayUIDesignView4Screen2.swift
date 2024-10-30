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
                            Toggle(isOn: $toggle) {
                                Text(" All Day")
                                    .FontForegroundColorModifier(20, .regular, .default, nil, nil, .black)
                            }
                            .tint(.black)
                            .scaleEffect(1.1)
                            .padding(.horizontal,18)
                            
                            // Here this view will appear when toggle is false
                            
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
                            
                            VStack(alignment: .leading ,spacing: 8){
                                Text("Repeat")
                                    .FontForegroundColorModifier(20, .regular, .default, nil, nil, .gray)
                                HStack{
                                    Text("Does not repeat")
                                        .FontForegroundColorModifier(20, .regular, .default, nil, nil, .black)
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right")
                                        .resizable()
                                        .FontForegroundColorModifier(nil, .medium, .default, 11, 17, .gray)
                                }
                            }
                            .padding(.horizontal,6)
                            
                            
                        }
                        
                        
                        
                    }
                }
                
                
            }
            .padding(.horizontal,15)
        }
    }
    
    var header: some View {
        HStack{
            Image(systemName: "chevron.left")
                .resizable()
                .FontForegroundColorModifier(nil, .medium, .default, 11, 17, .black)
            
            Spacer()
            
            Text("Add date")
                .FontForegroundColorModifier(20, .medium, .default, nil, nil, .black)
            
            Spacer()
            
            Text("Next")
                .FontForegroundColorModifier(20, .medium, .default, nil, nil, .black)
            
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
    
}

struct ThursdayUIDesignView4Screen2_Previews: PreviewProvider {
    static var previews: some View {
        ThursdayUIDesignView4Screen2()
    }
}
