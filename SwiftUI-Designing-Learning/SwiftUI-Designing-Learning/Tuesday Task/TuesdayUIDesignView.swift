//
//  TuesdayUIDesignView.swift
//  SwiftUI-Designing-Learning
//
//  Created by Apple on 08/10/2024.
//

import SwiftUI

struct TuesdayUIDesignView: View {
    
    @State var toggle: Bool = false
    @State var selectedTime = Date()
    
    
    @ObservedObject var vm = TuesdayUIDesignViewModel()
    
    var body: some View {
        
        ZStack{
            Image("blackBackground")
                .resizable().opacity(0.5)
                .scaledToFill()
                .blur(radius: 20)
                .ignoresSafeArea()
            Color.black.opacity(0.75).ignoresSafeArea()
            
            VStack(spacing: 10){
                
                headerButton
                    .padding(.bottom)
                
                VStack(spacing: 60){
                    
                    firstLabel
                    
                    secondLabel
                }
                
                Spacer()
                
            }
            .frame(width: 400)
            
        }
        
    }
    
    var headerButton: some View{
        HStack{
            Button(action: {
                
            }, label: {
                Image(systemName: "chevron.backward")
                    .resizable()
                    .customModifier1(nil, nil, nil, 10, 20, .white)
            })
            Spacer()
            
        }
        .padding()

    }
    
    var firstLabel: some View{
        
        VStack{
            
            HStack{
                Text("Daily Alert")
                    .customModifier1(18, .regular, .default, nil, 50, .white)
                
                Spacer()
                
                Toggle(isOn: $toggle) {
                    Text("")
                }
                .tint(
                    colorLiteralModifier(1, 0.7450980392, 0.7529411765)
                )
                .scaleEffect(1.2)
                .frame(width: 45 ,height: 50)
                .padding()
                
            }
            .padding()
            .padding(.top)
            .frame(width: 365 , height: 50)
            
            Rectangle().fill(
                colorLiteralModifier(0.2156862745, 0.2156862745, 0.2470588235)
            )
            .frame(width: 365 , height: 1)
            
            HStack{
                Text("Time")
                    .customModifier1(18, .regular, .default, nil, 50, .white)
                
                Spacer()
                    
                    ZStack{
                                                Text("3:00")
//                        Text("\(selectedTime, formatter: timeFormatter)")
                            .customModifier1(26, .regular, .default, 90, 45, .white)
                            .offset(x:9)
                        
//                        // Time Picker With Hours and minuts
//                        DatePicker("", selection: $selectedTime, displayedComponents: .hourAndMinute)
//                            .labelsHidden()
//                            .customModifier1(26, .regular, .default, 90, 45, .white)
//                            .offset(x:9)
//
                    }
                    .customModifier2(80, 35, Color.gray, 0.3, 8)
                    
                
                
                
                HStack(spacing: 0){
                    Text("AM")
                        .customModifier1(16, .medium, .default, 45, 30, .white)
                        .customModifier2(nil, nil, Color.gray, 0.6, 8)
                    
                    Text("PM")
                        .customModifier1(16, .medium, .default, 40, 30, .white)
                }
                .customModifier2(90, 35, Color.gray, 0.3, 8)
                
                
            }
            .padding()
            .padding(.bottom)
            .frame(width: 365 , height: 50)
            
        }
        .padding()
        .customModifier2(365, 115, Color.gray, 0.1, 20)
        
    }
    private var timeFormatter: DateFormatter {
            let formatter = DateFormatter()
        formatter.timeStyle = .short
            return formatter
        }
    
    var secondLabel: some View{
        
        VStack{
            ScrollView{
                VStack{
                    
                    HStack{
                        Text("Hawaii Holiday")
                            .customModifier1(18, .regular, .default, nil, 50, .white)
                        
                        Spacer()
                        
                        Image(systemName: "checkmark")
                            .resizable()
                            .customModifier1(nil, nil, nil, 21, 15,
                                           colorLiteralModifier(0.8705882353, 0.6274509804, 0.6352941176))
                    }
                    .padding()
                    .frame(width: 365 , height: 35)
                    
                    Rectangle().fill(
                        colorLiteralModifier(0.2156862745, 0.2156862745, 0.2470588235)
                    )
                    .frame(width: 365 , height: 1)
                    
                    HStack{
                        Text("Rosa's Birthday")
                            .customModifier1(18, .regular, .default, nil, 50, .white)
                        
                        Spacer()
                        
                        Image(systemName: "checkmark")
                            .resizable()
                            .customModifier1(nil, nil, nil, 21, 15,
                                           colorLiteralModifier(0.8705882353, 0.6274509804, 0.6352941176))
                    }
                    .padding()
                    .frame(width: 365 , height: 35)
                    
                    Rectangle().fill(
                        colorLiteralModifier(0.2156862745, 0.2156862745, 0.2470588235)
                    )
                    .frame(width: 365 , height: 1)
                    
                    HStack{
                        Text("Doctor's Appointment")
                            .customModifier1(18, .regular, .default, nil, 50, .white)
                        
                        Spacer()
                    }
                    .padding()
                    .frame(width: 365 , height: 35)
                    
                    
                }
            }
            .padding()
            .customModifier2(365, 170, Color.gray, 0.1, 20)
            
            
            Text("You can choose up to 5 events or streaks to add to your daily alert")
                .customModifier1(13, .regular, .default, 350, nil, .gray)
                .padding()
            
        }
        
    }
    
}

struct TuesdayUIDesignView_Previews: PreviewProvider {
    static var previews: some View {
        TuesdayUIDesignView()
    }
}
