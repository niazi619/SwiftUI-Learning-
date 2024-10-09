//
//  TuesdayUIDesignView.swift
//  SwiftUI-Designing-Learning
//
//  Created by Apple on 08/10/2024.
//

import SwiftUI

struct TuesdayUIDesignView: View {

    @State var toggle: Bool = false
//    @State var selectedTime = Date()
    @State var selectedHour: Int = 12
    @State var selectedMinute: Int = 0
    @State var amPmChange: Bool = false
    @State var isAM: Bool = true

    @ObservedObject var vm = TuesdayUIDesignViewModel()

    var body: some View {

        ZStack{
            Image("blackBackground")
                .resizable().opacity(0.5)
                .scaledToFill()
                .blur(radius: 20)
                .ignoresSafeArea()
            Color.black.opacity(0.75).ignoresSafeArea()
            
            Form {
                Section(header: headerButton) {
                    firstLabel
                }
                .listRowBackground(Color.clear)
                
                Section {
                    secondLabel
                }
                .listRowBackground(Color.clear)
            }
            .scrollContentBackground(.hidden)
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
        .offset(x:-40)

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

                VStack{
                    
                    HStack(spacing: 0){
                        
                        Picker("Hour", selection: $selectedHour) {
                            ForEach(hours, id: \.self) { hour in
                                Text("\(hour)").tag(hour)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                        .accentColor(.white)
                        .pickerStyle(MenuPickerStyle())
                        
                        Text(":")
                            .customModifier1(18, .regular, .default, 5, 45, .white)
                        
                        Picker("Minute", selection: $selectedMinute) {
                            ForEach(minutes, id: \.self) { minute in
                                Text(String(format: "%02d", minute)).tag(minute)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                        .accentColor(.white)
                        .pickerStyle(MenuPickerStyle())
                        .offset(x:-15)
                        
                    }
                    .customModifier2(90, 35, Color.gray, 0.3, 8)
                    
                }
                // AM/PM Toggle
                Picker("AM/PM", selection: $isAM) {
                    Text("AM").tag(true)
                    Text("PM").tag(false)
                }
                .pickerStyle(SegmentedPickerStyle()) // Segmented style for AM/PM
                .customModifier2(90, 35, Color.gray, 0.3, 8)


            }
            .padding()
            .padding(.bottom)
            .frame(width: 365 , height: 50)

        }
        .padding()
        .customModifier2(365, 115, Color.gray, 0.1, 20)

    }
    // Hour range from 1 to 12
    private var hours: [Int] {
        Array(1...12)
    }
    
    // Minute range from 0 to 59
    private var minutes: [Int] {
        Array(0...59)
    }
    
    private var formattedTime: String {
        let hour = selectedHour == 12 ? 12 : selectedHour % 12
        let period = isAM ? "AM" : "PM"
        return "\(hour):\(String(format: "%02d", selectedMinute)) \(period)"
    }
    
    private var timeFormatter: DateFormatter {
            let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
            return formatter
        }

    private var amPmFormatter: DateFormatter {
           let formatter = DateFormatter()
           formatter.dateFormat = "a"  // AM/PM designator
           return formatter
       }

    var secondLabel: some View{

        VStack{

            ScrollView{
                ForEach(vm.dataList.indices, id: \.self){ index in

                    HStack{
                        Text("\(vm.dataList[index].Text ?? "")")
                            .customModifier1(18, .regular, .default, nil, 50, .white)

                        Spacer()

                        Image(systemName: "checkmark")
                            .resizable()
                            .customModifier1(nil, nil, nil, 21, 15,
                                             colorLiteralModifier(0.8705882353, 0.6274509804, 0.6352941176))
                            .opacity(vm.dataList[index].isChecked ? 1 : 0)
                    }
                    .padding()
                    .frame(width: 365 , height: 35)
                    .onTapGesture {
                        withAnimation(){
                            vm.dataList[index].isChecked.toggle()
                        }
                    }

                    Rectangle().fill(
                        colorLiteralModifier(0.2156862745, 0.2156862745, 0.2470588235)
                    )
                    .frame(width: 365 , height: 1)

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
