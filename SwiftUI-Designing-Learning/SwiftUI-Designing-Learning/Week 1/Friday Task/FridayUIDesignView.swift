//
//  FridayUIDesignView.swift
//  SwiftUI-Designing-Learning
//
//  Created by Apple on 14/10/2024.
//

import SwiftUI

struct FridayUIDesignView: View {
    
    @State var codeDigits: [String] = Array(repeating: "", count: 6)
    @FocusState private var focusedField: Int?
    
    var body: some View {

        ZStack{
            Color.white.ignoresSafeArea()
            VStack(alignment: .leading, spacing: 40){
                
                header
                
                VerifyCodeBody
            }
            .padding(20)

        }
        .onAppear{
            focusedField = 0
        }

    }
        
    
    func verifyCodeShow() {
        
        let code = codeDigits.joined()
        print("Verification Code Entered: \(code)")
    }
    
    var header: some View {
        HStack{
            
            Button(action: {

            }, label: {
                Image(systemName: "chevron.backward")
                    .resizable()
                    .FontForegroundColorModifier(nil, .bold, nil, 10, 18, Color.black)
            })
            
            Spacer()
            
            Text("Verify Code")
                .FontForegroundColorModifier(19, .bold, .default, nil, nil, Color.black)
            
            Spacer()
        }
    }
    
    var VerifyCodeBody: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Enter 6-digit code")
                .FontForegroundColorModifier(20, .bold, .default, nil, nil, Color.black)
            
            Text("Code was send to 555-555-1212 or email address")
                .FontForegroundColorModifier(13, .regular, .default, nil, nil, Color.gray)
            
            HStack(spacing: 10){
                
                ForEach(0..<6, id: \.self) { index in
                    TextField("", text: $codeDigits[index])
                        .keyboardType(.numberPad)
                        .FontForegroundColorModifier(20, .regular, .default, 40, 60, .black)
                        .FrameBackgroundColorModifier(40, 60, .white, 0.5, 3)
                        .multilineTextAlignment(.center)
                        .overlay(RoundedRectangle(cornerRadius: 3)
                            .stroke(Color("customSpanishGray"),
                                   lineWidth: 2))
                        .focused($focusedField, equals: index)
                        .onChange(of: codeDigits[index]) { newValue in
                            if newValue.count == 1{
                                focusedField = index + 1
                            }else if newValue.isEmpty{
                                focusedField = index - 1
                            }
                            
                        }
                    
                }
                
            }
            
            Text("Resend code 30s Resend?")
                .FontForegroundColorModifier(13, .regular, .default, nil, nil, Color.gray)
            
            HStack{
                Text("Didn't get a code?")
                    .FontForegroundColorModifier(13, .regular, .default, nil, nil, Color.gray)
                Button(action: {}, label: {
                    Text("Request a call")
                        .FontForegroundColorModifier(13, .regular, .default, nil, nil, Color.blue)
                })
            }
            
            Spacer()
            buttonView
        }
        .padding(.horizontal,20)
    }
    
    var buttonView: some View {
        Button(action: {
            if !codeDigits.isEmpty {
                verifyCodeShow()
            }else{
                print("Your Code is not complete .")
            }
            
        }, label: {
            Text("Next")
                .FontForegroundColorModifier(15, .bold, .default, 325, 40, .white)
                .FrameBackgroundColorModifier(325, 40, .black, 1, 1)
                .padding(.bottom)
        })
    }
    
}

struct FridayUIDesignView_Previews: PreviewProvider {
    static var previews: some View {
        FridayUIDesignView()
    }
}
