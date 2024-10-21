//
//  TuesdayUIDesignView2.swift
//  SwiftUI-Designing-Learning
//
//  Created by Apple on 15/10/2024.
//

import SwiftUI
import PhotosUI

struct TuesdayUIDesignView2: View {
    
    @ObservedObject var vm = TuesdayUIDesign2ViewModel()
    
    var body: some View {
        
        ZStack{
            Color.white.ignoresSafeArea()
            VStack{
                
                headerView
                
                textView
                                
                rectangleCellBarView(no: 3)
                
                photoPickerView
                
                sectionsView
                
                ButtonView(text: "NEXT")
               
            }
            .padding(.horizontal)
            
        }
        
       
    }
    
    var headerView: some View {
        HStack(spacing: 80){
            
            Button(action: {

            }, label: {
                Image(systemName: "chevron.backward")
                    .resizable()
                    .FontForegroundColorModifier(25, .bold, .default, 10, 16, Color("customGray"))
            })
            
            
            Text("3 steps left")
                .FontForegroundColorModifier(15, .bold, .default, nil, nil, .black)
                .padding(.leading,20)
            
            
            Text("Preview")
                .FontForegroundColorModifier(18, .bold, .default, nil, nil, .blue)
        }
        
    }
    
    var textView: some View {
        VStack(alignment: .leading ,spacing: 10){
            Text("Just a few more steps!")
                .FontForegroundColorModifier(18, .bold, .default, nil, nil, .black)
            
            Text("Let's get you listed! Folllow the steps below . Once you are approved you will be able to customize you're username. ")
                .FontForegroundColorModifier(12, .regular, .default, 335, nil, .gray)
            
        }
        .padding(20)

    }
    
    var photoPickerView: some View {
        
        VStack{
            if let image = vm.selectedImage{
                PhotosPicker(selection: $vm.selections ,matching: .images) {
                    Image(uiImage: image)
                        .resizable()
                        .frame(width: 400 ,height: 200)
//                        .scaledToFill()
//                        .aspectRatio( contentMode: .fit)
                }
            }else{
                PhotosPicker(selection: $vm.selections ,matching: .images) {
                    VStack(spacing: 20){
                        
                        Image("movieCamera")
                            .resizable()
                            .frame(width: 30 ,height: 30)
                        
                        Text("Add Photos")
                            .FontForegroundColorModifier(23, .bold, .default, nil, nil, .gray.opacity(0.8))
                        
                    }
                    .frame(width: 400 ,height: 200)
                }
            }
        }
        .padding()

    }
    
    var sectionsView: some View {
        VStack {
            
            HStack{
                VStack(alignment: .leading ,spacing: 10){
                    Text("Photos")
                        .FontForegroundColorModifier(16, .light, .default, nil, nil, .black)
                    
                    Text("Add photos")
                        .FontForegroundColorModifier(12, .light, .default, nil, nil, .gray)
                }
                Spacer()
                Image(systemName: "chevron.right")
                    .resizable()
                    .FontForegroundColorModifier(nil, .semibold, .default, 7, 12, .black)
                
            }
            
            Rectangle()
                .FontForegroundColorModifier(nil, .light, .default, 360, 1, Color("customSpanishGray"))
            
            HStack{
                VStack(alignment: .leading ,spacing: 10){
                    Text("Username (locked until approval)")
                        .FontForegroundColorModifier(16, .light, .default, nil, nil, .black)
                    
                    Text("@user234235235235")
                        .FontForegroundColorModifier(12, .light, .default, nil, nil, .gray)
                }
                Spacer()
                Image("carLock")
                    .resizable()
                    .FontForegroundColorModifier(nil, .semibold, .default, 40, 50, .black)
                
            }
            
            Rectangle()
                .FontForegroundColorModifier(nil, .light, .default, 360, 1, Color("customSpanishGray"))
            
            HStack{
                VStack(alignment: .leading ,spacing: 10){
                    Text("Payment Methods")
                        .FontForegroundColorModifier(16, .light, .default, nil, nil, .black)
                    
                    Text("Select which payment methods you accept")
                        .FontForegroundColorModifier(12, .light, .default, nil, nil, .black)
                }
                Spacer()
                Image(systemName: "chevron.right")
                    .resizable()
                    .FontForegroundColorModifier(nil, .semibold, .default, 7, 12, .black)
                
            }
            
            Rectangle()
                .FontForegroundColorModifier(nil, .light, .default, 360, 1, Color("customSpanishGray"))
            
            HStack{
                VStack(alignment: .leading ,spacing: 10){
                    Text("Set Ammenities")
                        .FontForegroundColorModifier(16, .light, .default, nil, nil, .black)
                    
                    Text("What do you offer that's special?")
                        .FontForegroundColorModifier(12, .light, .default, nil, nil, .black)
                }
                Spacer()
                Image(systemName: "chevron.right")
                    .resizable()
                    .FontForegroundColorModifier(nil, .semibold, .default, 7, 12, .black)
                
            }
            
            Rectangle()
                .FontForegroundColorModifier(nil, .light, .default, 360, 1, Color("customSpanishGray"))
            
        }
        .padding(30)

    }
    
}

struct rectangleCellBarView: View {
    
    var no: Int
    
    var body: some View {
        ZStack(alignment: .leading) {
            
            HStack(spacing: 1.5) {
                ForEach(0..<5, id: \.self) { index in
                    Rectangle()
                        .fill(Color.black)
                        .frame(width: 80 ,height: 8)
                }
            }
            
            HStack(spacing: 1.5) {
                ForEach(0..<no, id: \.self) { index in
                    Rectangle()
                        .fill(Color("customGreen"))
                        .frame(width: 80 ,height: 8)
                }
            }
            
        }
    }
    
}

struct TuesdayUIDesignView2_Previews: PreviewProvider {
    static var previews: some View {
        TuesdayUIDesignView2()
    }
}
