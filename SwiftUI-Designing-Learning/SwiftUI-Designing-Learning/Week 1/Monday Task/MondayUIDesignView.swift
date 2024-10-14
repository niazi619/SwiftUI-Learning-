//
//  MondayUIDesignView.swift
//  SwiftUI-Designing-Learning
//
//  Created by Apple on 07/10/2024.
//

import SwiftUI

// Custom View Modifier

struct FontForegroundColorModifier: ViewModifier{
   
    var fontSize: CGFloat?
    var fontWeight: Font.Weight?
    var fontDesign: Font.Design?
    var width: CGFloat?
    var height: CGFloat?
    var foregroundColor: Color?
    
    func body(content: Content) -> some View {
        content
            .font(.system(size:fontSize ?? 10 ,weight: fontWeight ,design: fontDesign))
            .frame(width: width ,height: height)
            .foregroundColor(foregroundColor)
    }
    
}

struct FrameBackgroundColorModifier: ViewModifier{
   
    var width: CGFloat?
    var height: CGFloat?
    var backgroundColor: Color?
    var opacity: Double?
    var cornerRadius: CGFloat?
    
    func body(content: Content) -> some View {
        content
            .frame(width: width ,height: height)
            .background(backgroundColor?.opacity(opacity ?? 1).cornerRadius(cornerRadius ?? 0))
    }
    
}

extension View{
    func FontForegroundColorModifier(_ fontSize: CGFloat? ,_ fontWeight: Font.Weight? , _ fontDesign: Font.Design? ,_ width: CGFloat? ,_ height: CGFloat? ,_ foregroundColor: Color?) -> some View {
        self.modifier(SwiftUI_Designing_Learning.FontForegroundColorModifier(fontSize: fontSize ,fontWeight: fontWeight ,fontDesign: fontDesign , width: width ,height: height, foregroundColor: foregroundColor))
    }
    
    func FrameBackgroundColorModifier(_ width: CGFloat? ,_ height: CGFloat? ,_ backgroundColor: Color? ,_ opacity: Double? ,_ cornerRadius: CGFloat?) -> some View {
        self.modifier(SwiftUI_Designing_Learning.FrameBackgroundColorModifier(width: width ,height: height ,backgroundColor: backgroundColor ,opacity: opacity ,cornerRadius: cornerRadius))
    }
    
}

// Custom color literal function to create colors based on RGB values
func colorLiteralModifier(_ red: Double, _ green: Double, _ blue: Double) -> Color {
    return Color(red: red, green: green, blue: blue)
}


struct MondayUIDesignView: View {
    var body: some View {
        
        ZStack{
                Image("nightBackground")
                    .resizable()
                    .ignoresSafeArea()
            
            VStack{

            ScrollView{
                
                    Spacer()
                logoRing
                
                subscribeOrFreeTag
                
                freeAndSubscribeButton
                
                moreInfo
                }
            }
            
        }
        
    }
    
    var logoRing: some View {
        ZStack{

            Circle()
                .stroke(
                    LinearGradient(
                        gradient: Gradient(colors: [Color(#colorLiteral(red: 0.3333333333, green: 0.3333333333, blue: 0.3333333333, alpha: 1))]),
                        startPoint: .trailing,
                        endPoint: .leading) ,
                    lineWidth: 7
                )
                .frame(width: 150 ,height: 150)

            Circle()
                .trim(from: 0 ,to: 0.76)
                .stroke(
                    LinearGradient(
                        gradient: Gradient(colors: [Color(#colorLiteral(red: 0, green: 1, blue: 0.9019607843, alpha: 1)) ,Color(#colorLiteral(red: 0, green: 1, blue: 0, alpha: 1)) ,Color(#colorLiteral(red: 1, green: 0, blue: 0.9803921569, alpha: 1))]),
                        startPoint: .bottom,
                        endPoint: .top) ,
                    lineWidth: 8
                )	
                .rotationEffect(.degrees(-90))
                .frame(width: 150 ,height: 150)


            Image(systemName: "infinity")
                .resizable()
                .FontForegroundColorModifier(nil,nil,nil, 90, 40, .white)

        }
        .padding(.top,10)
        .padding(20)
    }
    
    var subscribeOrFreeTag: some View {
        HStack{

            VStack(alignment: .leading){
                
                Text("Yearly")
                    .FontForegroundColorModifier(29, .heavy, .default, nil, nil, Color("customBisque"))
                
                Text("$14.99")
                    .FontForegroundColorModifier(22, .regular, .default, nil, nil, Color("customMediumGray"))
                    .padding(.bottom,4)

                Text("Free 7-day Trial.")
                    .FontForegroundColorModifier(15, .medium, .default, nil, 30, Color("customSpanishGray"))
                    .padding(.bottom,4)

                Text("SELECTED")
                    .FontForegroundColorModifier(17,.medium,.default, nil, nil, Color("customBisque2"))
                    .overlay( RoundedRectangle(cornerRadius:5) .stroke(
                        Color("customBisque2"), lineWidth: 2)
                        .frame(width: 95 ,height: 25))
                    .offset(x:15)

                Rectangle()
                    .fill(Color("custom5D514C"))
                    .frame(width: 130 ,height: 2)
                    .padding(.bottom)

                Text("Forever")
                    .FontForegroundColorModifier(29, .heavy, .default, nil, nil, Color("customBisque"))

                Text("$49.99")
                    .FontForegroundColorModifier(22, .regular, .default, nil, nil, Color("customMediumGray"))
                    .padding(.bottom,4)

                Text("One Time Purchase.")
                    .FontForegroundColorModifier(15, .medium, .default, nil, 30,  Color("customSpanishGray"))
                    .padding(.bottom,4)


            }
            .frame(width: 150)

            Rectangle()
                .fill(Color("customBisque"))
                .frame(width: 2 ,height: 310)

            VStack(alignment: .leading ,spacing: 45){

                Text("A breathtaking time tracking tool that increases productivity   and motivation")
                    .FontForegroundColorModifier(20, .regular, .default, nil, nil, .white)

                Button(action: {}, label: {
                    Text("Learn more >")
                        .FontForegroundColorModifier(17, .light, .default, nil, nil, .gray)
                })
            }
            .frame(width: 150)

        }
        .padding()
        .FrameBackgroundColorModifier(350, 350, Color.black, nil, 30)
        .overlay( RoundedRectangle(cornerRadius: 30)
            .stroke(Color("customBisque"),
                lineWidth: 2))
        .padding(40)

    }
    
    var freeAndSubscribeButton: some View {
        
        VStack(spacing: 20){
            
            Button(action: {
                
            }, label: {
                Text("Try Free & Subscribe")
                    .padding()
                    .FontForegroundColorModifier(28, .regular, .default, 350, 90, .white)
                    .background(Color.black.cornerRadius(60))
                    .overlay(RoundedRectangle(cornerRadius: 60)
                        .stroke(Color("customDarkCyan"),
                            lineWidth: 2))
            })
            
            Text("$14.99 per year after FREE 7-day trial")
                .FontForegroundColorModifier(15, .regular, .default, nil, nil, .gray)
        }
        .padding(.bottom)
        
    }
    
    var moreInfo: some View {
        VStack(alignment: .center) {
            
            Text("More Information")
                .foregroundColor(.white)
                .padding()
            
            Text("Integer ac interdum lacus. Nunc porta semper lacus a varius. Pellentesque habilant morbi tristique senectus at netus at malesuada fames ac turpis egestas. Nunc sagilitus consectetur velit. ac gravida nunc gravida et. Vesibulum at eros imperdiet. Volutpat nunc vitae. Ornare erat. Proin interdum aliquet porta. Fusce ut semper ligula.")
                .FontForegroundColorModifier(14, .regular, .default, nil, nil, .white)
                .multilineTextAlignment(.center)
                .lineSpacing(0)
        }
            .padding()
            .frame(width: 360)

    }
    
}

struct MondayUIDesignView_Previews: PreviewProvider {
    static var previews: some View {
        MondayUIDesignView()
    }
}
