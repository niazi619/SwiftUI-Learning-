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
            
            VStack(spacing: 0){
                // Make Header Button Static or outSide of Form scrollView.
                headerButton
                
                Form {
                    Section {
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
        .offset(x:50)
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
                    Color("customLightPink")
                )
                .scaleEffect(1.2)
                .frame(width: 45 ,height: 50)
                .padding()

            }
            .padding()
            .padding(.top)
            .frame(width: 365 , height: 50)

            Rectangle().fill(
                Color("customGray")
            )
            .frame(width: 365 , height: 1)

            HStack{
                Text("Time")
                    .customModifier1(18, .regular, .default, nil, 50, .white)

                Spacer()
                    
                    HStack(spacing: 0){
                        
                        DatePicker("Select the time", selection: $selectedTime ,displayedComponents: .hourAndMinute)
                            .labelsHidden()
                            .colorInvert()
//                            .colorScheme(.dark)
//                            .accentColor(Color.white)
                            .datePickerStyle(CompactDatePickerStyle())
                        
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
            
            VStack{
                ForEach(vm.dataList.indices, id: \.self){ index in
                    
                    VStack{
                        HStack{
                            Text("\(vm.dataList[index].Text ?? "")")
                                .customModifier1(18, .regular, .default, nil, 50, .white)
                            
                            Spacer()
                            
                            Image(systemName: "checkmark")
                                .resizable()
                                .customModifier1(nil, nil, nil, 21, 15,
                                                 Color("customLightPink"))
                                .opacity(vm.dataList[index].isChecked ? 1 : 0)
                        }
                        .padding(.horizontal)
                        .frame(width: 365 , height: 35)
                        .background(Color.black.opacity(0.01))
                        .onTapGesture {
                            withAnimation(){
                                vm.dataList[index].isChecked.toggle()
                            }
                        }
                        
                        Rectangle().fill(
                            Color("customGray")
                        )
                        .frame(width: 365 , height: 1)
                        
                    }
                    
                }
            }
            .padding()
            .customModifier2(365, nil, Color.gray, 0.1, 20)

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
