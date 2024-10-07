//
//  MondayUIDesignView.swift
//  SwiftUI-Designing-Learning
//
//  Created by Apple on 07/10/2024.
//

import SwiftUI

// Custom View Modifier

struct FontModifiers: ViewModifier{
   
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

extension View{
    func fontModifiers(_ fontSize: CGFloat? ,_ fontWeight: Font.Weight? , _ fontDesign: Font.Design? ,_ width: CGFloat? ,_ height: CGFloat? ,_ foregroundColor: Color?) -> some View {
        self.modifier(FontModifiers(fontSize: fontSize ,fontWeight: fontWeight ,fontDesign: fontDesign , width: width ,height: height, foregroundColor: foregroundColor))
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
                .fontModifiers(nil,nil,nil, 90, 40, .white)

        }
        .padding(.top,10)
        .padding(20)
    }
    
    var subscribeOrFreeTag: some View {
        HStack{

            VStack(alignment: .leading){
                
                Text("Yearly")
                    .fontModifiers(29, .heavy, .default, nil, nil, colorLiteralModifier(1, 0.8705882353, 0.8156862745))
                
                Text("$14.99")
                    .fontModifiers(22, .regular, .default, nil, nil, colorLiteralModifier(0.7333333333, 0.7333333333, 0.7333333333))
                    .padding(.bottom,4)

                Text("Free 7-day Trial.")
                    .fontModifiers(15, .medium, .default, nil, 30,  colorLiteralModifier(0.6117647059, 0.6117647059, 0.6117647059))
                    .padding(.bottom,4)

                Text("SELECTED")
                    .fontModifiers(17,.medium,.default, nil, nil, colorLiteralModifier(0.9294117647, 0.8078431373, 0.7568627451))
                    .overlay( RoundedRectangle(cornerRadius:5) .stroke(Color(#colorLiteral(red: 0.9294117647, green: 0.8078431373, blue: 0.7568627451, alpha: 1)), lineWidth: 2)
                        .frame(width: 95 ,height: 25))
                    .offset(x:15)

                Rectangle()
                    .fill(
                        colorLiteralModifier(0.3647058824, 0.3176470588, 0.2980392157)
                    )
                    .frame(width: 130 ,height: 2)
                    .padding(.bottom)

                Text("Forever")
                    .fontModifiers(29, .heavy, .default, nil, nil, colorLiteralModifier(1, 0.8705882353, 0.8156862745))

                Text("$49.99")
                    .fontModifiers(22, .regular, .default, nil, nil, colorLiteralModifier(0.7333333333, 0.7333333333, 0.7333333333))
                    .padding(.bottom,4)

                Text("One Time Purchase.")
                    .fontModifiers(15, .medium, .default, nil, 30,  colorLiteralModifier(0.6117647059, 0.6117647059, 0.6117647059))
                    .padding(.bottom,4)


            }
            .frame(width: 150)

            Rectangle()
                .fill(
                    colorLiteralModifier(0.937254902, 0.7882352941, 0.7411764706)
                )
                .frame(width: 2 ,height: 310)

            VStack(alignment: .leading ,spacing: 45){

                Text("A breathtaking time tracking tool that increases productivity   and motivation")
                    .fontModifiers(20, .regular, .default, nil, nil, .white)

                Button(action: {}, label: {
                    Text("Learn more >")
                        .fontModifiers(17, .light, .default, nil, nil, .gray)
                })
            }
            .frame(width: 150)

        }
        .padding()
        .frame(width: 350 ,height: 350)
        .background(Color.black .cornerRadius(30))
        .overlay( RoundedRectangle(cornerRadius: 30)
            .stroke(
                colorLiteralModifier(0.937254902, 0.7882352941, 0.7411764706),
                lineWidth: 2
            ))
        .padding(40)

    }
    
    var freeAndSubscribeButton: some View {
        
        VStack(spacing: 20){
            
            Button(action: {
                
            }, label: {
                Text("Try Free & Subscribe")
                    .padding()
                    .fontModifiers(28, .regular, .default, 350, 90, .white)
                    .background(Color.black.cornerRadius(60))
                    .overlay(RoundedRectangle(cornerRadius: 60)
                        .stroke(
                            colorLiteralModifier(0, 0.8235294118, 0.8196078431),
                            lineWidth: 2
                        ))
            })
            
            Text("$14.99 per year after FREE 7-day trial")
                .fontModifiers(15, .regular, .default, nil, nil, .gray)
        }
        .padding(.bottom)
        
    }
    
    var moreInfo: some View {
        VStack(alignment: .center) {
            
            Text("More Information")
                .foregroundColor(.white)
                .padding()
            
            Text("Integer ac interdum lacus. Nunc porta semper lacus a varius. Pellentesque habilant morbi tristique senectus at netus at malesuada fames ac turpis egestas. Nunc sagilitus consectetur velit. ac gravida nunc gravida et. Vesibulum at eros imperdiet. Volutpat nunc vitae. Ornare erat. Proin interdum aliquet porta. Fusce ut semper ligula.")
                .fontModifiers(14, .regular, .default, nil, nil, .white)
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
