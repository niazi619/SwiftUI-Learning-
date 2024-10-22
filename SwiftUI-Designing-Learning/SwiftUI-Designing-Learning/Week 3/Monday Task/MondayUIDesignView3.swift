//
//  MondayUIDesignView3.swift
//  SwiftUI-Designing-Learning
//
//  Created by Apple on 21/10/2024.
//

import SwiftUI

struct MondayUIDesignView3: View {
    
    @State var index: Int = 1
    @State var indexb: Int = 1
    @State var textEditorText: String = "" //New message ....
    
    var body: some View {
        
        ZStack{
            Color.white
            
            Rectangle().fill(Color.black)
                .frame(width: 400 ,height: 110)
                .offset(y:-400)
            
            VStack{
                
                headerView
                
                profileView
                                
                messageView
                
                textEditorView
                                
                Spacer()
                
                ButtonView(text: "CHAT")
                
            }
            .padding(.horizontal)
        }
        
    }
    
    var headerView: some View {
        HStack{
            
            Button(action: {

            }, label: {
                Image(systemName: "chevron.backward")
                    .resizable()
                    .FontForegroundColorModifier(25, .semibold, .default, 10, 17, .white)
            })
            
            Spacer()
            
            Text("Message")
                .FontForegroundColorModifier(18, .regular, .default, nil, nil, .white)
            
            Spacer()
        }
        
    }
    
    var profileView: some View {
        HStack{
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                Image("profileImage")
                    .resizable()
                    .frame(width: 55 ,height: 55)
                
                Circle()
                    .FontForegroundColorModifier(nil, .bold, .default, 8, 8, Color("customGreen"))
                    .overlay(RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.white,lineWidth: 1))
                    .offset(x:-5 ,y:5)
                    
            }
            
            VStack(alignment: .leading ,spacing: 10) {
                HStack{
                    Text("Juan")
                        .FontForegroundColorModifier(18, .regular, .default, nil, nil, .black)
                    Image(systemName: "checkmark.shield.fill")
                        .resizable()
                        .FontForegroundColorModifier(nil, .regular, .default, 15, 15, Color("customGreen"))
                }
                
                HStack{
                    Image(systemName: "paperplane.fill")
                        .resizable()
                        .FontForegroundColorModifier(nil, .regular, .default, 12, 12, .black)
                    Text("3.3 mi")
                    Text("5 min")
                }
                .FontForegroundColorModifier(12, .regular, .default, nil, nil, Color("customDeepGray"))
                
                Text("4.87* 22,000 Reviews in 4 Years .Last 09.28.2020")
                    .FontForegroundColorModifier(11, .regular, .default, nil, nil, Color("customBlackPearl"))
            }
            .offset(y:8)
            
        }
        .padding([.trailing,.top,.bottom])
        .offset(x:-10)

    }
    
    var messageView: some  View {
        VStack(alignment: .leading ,spacing: 20) {
            Text("Tap a message to send or write your own.")
                .FontForegroundColorModifier(15, .regular, .default, nil, nil,.black)
                .padding(20)
                .offset(x:-25)
            
            Text("I need delivery in")
                .FontForegroundColorModifier(16, .regular, .default, nil, nil,.black)
            
            HStack(spacing:0){
                Text("Now (About 5min)")
                    .FontForegroundColorModifier(12, index == 1 ? .medium : .regular, .default, nil, nil,.black)
                    .FrameBackgroundColorModifier(120, 40, index == 1 ? Color("customGreen") : Color.white, 1, 7)
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.5)){
                            index = 1
                        }
                    }
                
                Text("In 10 Min")
                    .FontForegroundColorModifier(12, index == 2 ? .medium : .regular, .default, nil, nil,.black)
                    .FrameBackgroundColorModifier(120, 40, index == 2 ? Color("customGreen") : Color.white, 1, 7)
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.5)){
                            index = 2
                        }
                    }
                
                Spacer()
                
                Image("crossicon")
                    .resizable()
                    .FontForegroundColorModifier(nil, .regular, .default, 15, 15, .gray)
                
            }
            
            Text("I'll pay by")
                .FontForegroundColorModifier(16, .regular, .default, nil, nil,.black)
            
            HStack(spacing:0){
                Text("Cash")
                    .FontForegroundColorModifier(12, indexb == 1 ? .medium : .regular, .default, nil, nil,.black)
                    .FrameBackgroundColorModifier(80, 30, indexb == 1 ? Color("customGreen") : Color.white, 1, 7)
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.5)){
                            indexb = 1
                        }
                    }
                
                Text("Stripe")
                    .FontForegroundColorModifier(12, indexb == 2 ? .medium : .regular, .default, nil, nil,.black)
                    .FrameBackgroundColorModifier(80, 30, indexb == 2 ? Color("customGreen") : Color.white, 1, 7)
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.5)){
                            indexb = 2
                        }
                    }
                
                Text("Apple")
                    .FontForegroundColorModifier(12, indexb == 3 ? .medium : .regular, .default, nil, nil,.black)
                    .FrameBackgroundColorModifier(80, 30, indexb == 3 ? Color("customGreen") : Color.white, 1, 7)
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.5)){
                            indexb = 3
                        }
                    }
                
                Spacer()
                
                Image("crossicon")
                    .resizable()
                    .FontForegroundColorModifier(nil, .regular, .default, 15, 15, .gray)
                
            }
            
        }
        .padding(.horizontal,7)

    }
    
    var textEditorView: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)){
            TextEditor(text: $textEditorText)
                .FontForegroundColorModifier(16, .regular, .default, 360, textEditorText.isEmpty ? 35 : 200, .black)
                .overlay(RoundedRectangle(cornerRadius: 0)
                    .stroke(Color.gray,lineWidth: 1))
                
             
            if textEditorText.isEmpty {
                Text("New message ....")
                    .offset(x:-100)
                    .FontForegroundColorModifier(16, .regular, .default, 360, 35, .black)
                    .overlay(RoundedRectangle(cornerRadius: 0)
                        .stroke(Color.blue,lineWidth: 1))
                    
            }
            
        }
        .padding(.top)

    }
    
}

struct MondayUIDesignView3_Previews: PreviewProvider {
    static var previews: some View {
        MondayUIDesignView3()
    }
}
