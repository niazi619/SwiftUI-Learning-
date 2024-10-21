//
//  MondayUIDesignView2.swift
//  SwiftUI-Designing-Learning
//
//  Created by Apple on 14/10/2024.
//

import SwiftUI

struct MondayUIDesignView2: View {
    
    var columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        
        ZStack{
            
            VStack{
                
                headerView
                Rectangle().fill(Color("customGray"))
                    .frame(width: 400 ,height: 1)
                
                Spacer()
                bodyView
                
                Spacer()
                ButtonView(text: "NEXT")
                
            }
            
        }
    }
    
    var headerView: some View {
        HStack{
            
            Button(action: {

            }, label: {
                Image(systemName: "chevron.backward")
                    .resizable()
                    .FontForegroundColorModifier(25, .heavy, .default, 11, 20, Color("customGray"))
            })
            
            Spacer()
            
            Text("List your truck")
                .FontForegroundColorModifier(18, .heavy, .default, nil, nil, Color("customGray"))
            
            Spacer()
        }
        .padding(.horizontal,10)
        
    }
    
    var bodyView: some View{
        VStack(alignment: .leading ,spacing: 20) {
            
            Text("Extra's")
                .FontForegroundColorModifier(22, .heavy, .default, nil, nil, Color("customGray"))
            Text("The selections below can be managed inside the site admin ")
                .font(.system(size: 11))
                .foregroundColor(.gray) +
            Text("Manage Amenities > Amenity Types > Extrs's. ")
                .font(.system(size: 11 ,weight: .bold))
                .foregroundColor(.black) +
            Text("This section will display amenities From the extra menu. The host can select multiple options. Users of the app can filter based on these options.")
                .font(.system(size: 11))
                .foregroundColor(.gray)
            
            
            LazyVGrid(columns: columns ,spacing: 20) {
                ForEach(0..<20, id: \.self) { index in
                    
                    
                    VStack{
                        Image("candy")
                            .resizable()
                            .frame(width: 30 ,height: 30)
                        Text("Water")
                            .FontForegroundColorModifier(11 , .regular, .default, nil, nil, .black)
                    }
                    .FrameBackgroundColorModifier(70, 70, .white, 0.5, 8)
                    .background((index == 0 || index == 3 || index == 4 || index == 7 || index == 8 || index == 11 || index == 12 || index == 15 || index == 16 || index == 19) ? Color("customGreen") : Color.white)
                    .overlay(RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.black , lineWidth: 1))
                    
                    
                }
            }
            
        }
        .padding(30)
        .offset(y:-15)
    }
    
}

struct MondayUIDesignView2_Previews: PreviewProvider {
    static var previews: some View {
        MondayUIDesignView2()
    }
}

struct ButtonView: View {
    
    @State var text: String = ""
    
    var body: some View {
        Button(action: {
            
        }, label: {
            Text("\(text)")
                .FontForegroundColorModifier(18, .bold, .default, 355, 60, .white)
                .FrameBackgroundColorModifier(355, 60, (Color("customBlackPearl")), 1, 1)
                .padding(.bottom)
        })
    }
    
}
