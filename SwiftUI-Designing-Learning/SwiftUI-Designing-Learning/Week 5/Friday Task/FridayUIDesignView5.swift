//
//  FridayUIDesignView5.swift
//  SwiftUI-Designing-Learning
//
//  Created by Apple on 08/11/2024.
//

import SwiftUI

struct Story: Identifiable {
    let id = UUID()
    let image: String
    let duration: Double
}

struct FridayUIDesignView5: View {
    var body: some View {
        
        StoryPageView(story: [
            Story(image: "blackBackground", duration: 5.0),
            Story(image: "nightBackground", duration: 5.0),
            Story(image: "midNightBackground", duration: 5.0)
        ])
        .navigationBarBackButtonHidden()
    }
}

struct FridayUIDesignView5_Previews: PreviewProvider {
    static var previews: some View {
        FridayUIDesignView5()
    }
}

struct StoryPageView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var story: [Story]
    @State private var currentIndex = 0
    @State private var progress: Double = 0.0
    @State private var isPaused = false
    private let timer = Timer.publish(every: 0.05, on: .main, in: .common).autoconnect()
    let duration: Double = 10.0
    
    var body: some View {
        
        ZStack{
            
            if currentIndex < story.count {
                
                Image(story[currentIndex].image)
                    .resizable()
                    .frame(width: 400, height: 860)
//                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .scaledToFill()
                    .clipped()
                    
                    .ignoresSafeArea()
            }
            
            VStack(spacing: 30){
                
                HStack{
                    ForEach(0..<story.count) { index in
                        
                        ZStack(alignment:.leading){
                            Rectangle().fill(Color.gray.opacity(0.15))
                                .frame(maxWidth: 400/CGFloat(story.count) ,maxHeight: 7)
                            Rectangle().fill(Color.white.opacity(0.5))
                                .frame(width:
                                        computeWidth(index: index)
                                       ,height: 7)
                        }
                        
                    }
                }
                .padding(.horizontal)
                
                HStack{
                    Spacer()
                    
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "xmark")
                            .resizable()
                            .FontForegroundColorModifier(15, .regular, .default, 15, 15, .black)
                            .background {
                                Circle()
                                    .fill(Color.gray)
                                    .frame(width: 30 ,height: 30)
                            }
                    })
                    
                }
                .padding(.horizontal)
                
                Spacer()
                
            }
            
        }
        .gesture(
            TapGesture()
                .onEnded({ _ in
                    isPaused.toggle()
                })
        )
        .gesture(
            DragGesture(minimumDistance: 0)
                .onEnded { value in
                    if value.translation.width < 0 {
                        goToNextStory()
                    } else {
                        goToPreviousStory()
                    }
                }
        )
        .offset(y:50)
        .onReceive(timer) { _ in
            if !isPaused {
                updateProgress()
            }
        }
    }
    
    private func updateProgress() {
        let storyDuration = story[currentIndex].duration
        progress += 0.05 / storyDuration
        
        if progress >= 1.0 {
            goToNextStory()
        }
    }
    
    private func goToNextStory() {
        if currentIndex < story.count - 1 {
            currentIndex += 1
        } else {
            currentIndex = 0
        }
        progress = 0.0
    }
    
    private func goToPreviousStory() {
        if currentIndex > 0 {
            currentIndex -= 1
        } else {
            currentIndex = story.count - 1
        }
        progress = 0.0
    }
    
    func computeWidth(index: Int) -> CGFloat {
        if index == currentIndex {
            return CGFloat(progress) * 360/CGFloat(story.count)
        } else if index < currentIndex {
            return 360/CGFloat(story.count)
        } else {
            return  0
        }
    }
    
}
