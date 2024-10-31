//
//  ThursdayUIDesignView4.swift
//  SwiftUI-Designing-Learning
//
//  Created by Apple on 30/10/2024.
//

import SwiftUI

struct ThursdayUIDesignView4: View {
    
    @State var textInput: String = ""
    private let characterLimit = 25
    
    var body: some View {
        NavigationStack{
            
            VStack{
                
                header
                
                textFieldAndLimitView
                
                Spacer()
                
            }
            .padding(.horizontal,20)
            
        }
    }
    
    var header: some View {
        HStack{
            Image(systemName: "xmark")
                .resizable()
                .FontForegroundColorModifier(nil, .medium, .default, 17, 17, .black)
            
            Spacer()
            
            Text("Add event")
                .FontForegroundColorModifier(20, .medium, .default, nil, nil, .black)
            
            Spacer()
            
            NavigationLink(destination: {
                ThursdayUIDesignView4Screen2()
            }, label: {
                Text("Next")
                    .FontForegroundColorModifier(20, .medium, .default, nil, nil, .black)
            })
            
        }
        .padding(.bottom,30)
    }
    
    var textFieldAndLimitView: some View {
        VStack(alignment: .leading) {
            
            Text("\(textInput.count)/25")
                .FontForegroundColorModifier(25, .medium, .default, nil, nil, .gray)
            
            TextField("Add Title", text: $textInput)
                .FontForegroundColorModifier(27, .regular, .default, nil, nil, .black)
                .onChange(of: textInput) { newValue in
                    if newValue.count > characterLimit {
                        textInput = String(newValue.prefix(characterLimit))
                    }
                }
            
        }
        .padding(.top,30)
    }
    
}

struct ThursdayUIDesignView4_Previews: PreviewProvider {
    static var previews: some View {
        ThursdayUIDesignView4()
    }
}
