//
//  ThursdayUIDesignView.swift
//  SwiftUI-Designing-Learning
//
//  Created by Apple on 11/10/2024.
//

import SwiftUI

struct ThursdayUIDesignView: View {
    
    @State private var currentPage = 0
    
    @ObservedObject var vm = ThursdayUIDesignViewModel()
    
    var body: some View {
       
        ZStack{
            Color.white.ignoresSafeArea()
//            RadialGradient(
//                gradient: Gradient(colors: [Color.cyan ,Color.white]),
//                center: .bottom,
//                startRadius: 50,
//                endRadius: 300)
                .ignoresSafeArea()
            
            VStack(spacing: 30){
                header
                
                tabView
                
                appleSignInButton
            }
            .padding(.bottom,140)
            
        }
        
    }
    
    var header: some View {
        HStack{
            Text("App Name")
                .FontForegroundColorModifier(20, .regular, .default, nil, nil, Color("customDeepGray"))
            
            Spacer()
        }
        .padding(.horizontal,25)
    }
    
    var tabView: some View {
        
        VStack(spacing: 0){
            TabView(selection: $currentPage) {
                ForEach(vm.textDataList.indices, id: \.self){ index in
                    TextView(obj: vm.textDataList[index])
                        .tag(index)
                    
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
            
            HStack {
                ForEach(0..<3) { index in
                    Circle()
                        .frame(width: currentPage == index ? 10 : 8, height: currentPage == index ? 10 : 8)
                        .foregroundColor(currentPage == index ? .black : .gray)
                }
            }
        }
        .frame(width: 400 ,height: 400)
        
    }
    
    var appleSignInButton: some View {
        
        Button(action: {
            
        }, label: {
            HStack(spacing: 0) {
                Image(systemName: "apple.logo")
                    .resizable()
                    .FontForegroundColorModifier(nil, nil, nil, 18, 20, .white)
                
                Text("Continue with Apple")
                    .FontForegroundColorModifier(22, .regular, .default, 220, 30, .white)
                    
            }
            .FrameBackgroundColorModifier(320, 50, .black, 1, 8)
        })
        
    }
    
}

struct ThursdayUIDesignView_Previews: PreviewProvider {
    static var previews: some View {
        ThursdayUIDesignView()
    }
}

struct TextView: View {
    var obj : ThursdayUIDesignDataModel

    var body: some View {
        
            VStack(alignment: .leading ,spacing: 40) {

                VStack(alignment: .leading ,spacing: 10) {
                    Text(obj.titleText1 ?? "")
                    Text(obj.titleText2 ?? "")
                    Text(obj.titleText3 ?? "")
                }
                .FontForegroundColorModifier(40, .bold, .rounded, nil, nil, Color("customBlack"))

                VStack(alignment: .leading ,spacing: 10) {
                    Text(obj.text1 ?? "")
                    Text(obj.text2 ?? "")
                    Text(obj.text3 ?? "")
                    Text(obj.text4 ?? "")
                }
                .FontForegroundColorModifier(18, .regular, .rounded, nil, nil, Color("customDeepGray"))
                .overlay(RoundedRectangle(cornerRadius: 0)
                    .stroke(
                        obj.color! ,lineWidth: 2
                    ))

            }
            .frame(width: 400 ,height: 300)
            .offset(x:-15)
    }
}
