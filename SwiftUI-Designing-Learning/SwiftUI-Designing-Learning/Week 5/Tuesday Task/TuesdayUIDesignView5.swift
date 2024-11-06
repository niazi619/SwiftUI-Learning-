//
//  TuesdayUIDesignView5.swift
//  SwiftUI-Designing-Learning
//
//  Created by Apple on 05/11/2024.
//

import SwiftUI

struct TuesdayUIDesignView5: View {
    
    @State var isPlaying: Bool = false
    @State var music: String = ""
    @State var currentSongIndex: Int = 0
    @State var backwardButtonDisable: Bool = false
    @State var forwardButtonDisable: Bool = false
    
    var songDuration: String {
        let minutes = Int(vm.duration) / 60
        let seconds = Int(vm.duration) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    @ObservedObject var vm = TuesdayUIDesignViewModel5()
    
    var body: some View {
        ZStack{
            Image("midNightBackground")
                .resizable()
                .frame(width: 450 ,height: 860)
                .scaledToFit()
                .clipped()
                .ignoresSafeArea()
            
            VStack(spacing:50){
                
                Spacer()
                TextView
                
                playerView
                
                
            }
            .frame(width: 400)
            .padding(.bottom,100)
            
        }
    }
    
    var TextView: some View {
        VStack(spacing: 15) {
//            Text("Welcome to Night Vale Story")
            Text(vm.musicDataList[currentSongIndex].songName)
                .FontForegroundColorModifier(25, .heavy, .rounded, nil, nil, .white)
         
            Text("by Joseph Fink")
                .FontForegroundColorModifier(15, .regular, .rounded, nil, nil, .white)
        }
    }
    
    var playerView: some View {
        VStack(spacing: 30) {
            
            HStack{
                
                // Current Time
//                Text("00:25")
                Text(vm.formatTime(vm.currentTime))
                    .FontForegroundColorModifier(13, .regular, .rounded, nil, nil, .white)
                
                ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
                    
                    Capsule().fill(Color("customDeepGray"))
                        .frame(width: 250 ,height: 5)
                    
                    Capsule().fill(Color("customPurple"))
                        .frame(width: CGFloat(vm.progress) * 250 ,height: 7)
                    
                }
                
                // Duration Time
//                Text(vm.musicDataList[currentSongIndex].songTime)
                Text(songDuration)
                    .FontForegroundColorModifier(13, .regular, .rounded, nil, nil, .white)
                
            }
            
            HStack(spacing: 45){
                
                Button(action: {
                    currentSongIndex = currentSongIndex - 1
                    forwardButtonDisable = false
                    
                }, label: {
                    Image(systemName: "backward.fill")
                        .resizable()
                        .FontForegroundColorModifier(20, .regular, .default, 25, 18, backwardButtonDisable == true ? .gray : .white)
                })
                .disabled(backwardButtonDisable)
                .onChange(of: currentSongIndex) { newValue in
                    if newValue <= 0 {
                        backwardButtonDisable = true
                    }
                }
                
                Button(action: {
                    
                    isPlaying.toggle()
                    music = vm.musicDataList[currentSongIndex].songURLString
                    vm.playMusic(music: music, playAndPause: isPlaying)
                    
                    if isPlaying{
                        vm.startTimer()
                    }else{
                        vm.stopTimer()
                    }
                    
                }, label: {
                    Image(systemName:isPlaying ? "pause.fill" : "play.fill")
                        .resizable()
                        .FontForegroundColorModifier(20, .regular, .default, 23, 23, .white)
                        .FrameBackgroundColorModifier(80, 80, Color("customPurple"), 1,60)
                })
                
                Button(action: {
                    currentSongIndex = currentSongIndex + 1
                    backwardButtonDisable = false
                    
                }, label: {
                    Image(systemName: "forward.fill")
                        .resizable()
                        .FontForegroundColorModifier(20, .regular, .default, 25, 18,forwardButtonDisable == true ? .gray : .white)
                })
                .disabled(forwardButtonDisable)
                .onChange(of: currentSongIndex) { newValue in
                    if newValue == vm.musicDataList.count - 1{
                        forwardButtonDisable = true
                    }
                }
                
            }
            
            
        }
        .onAppear{
            if currentSongIndex <= 0 {
                backwardButtonDisable = true
            }
        }
        .onDisappear {
            vm.stopTimer()
        }
    }
    
}

struct TuesdayUIDesignView5_Previews: PreviewProvider {
    static var previews: some View {
        TuesdayUIDesignView5()
    }
}
