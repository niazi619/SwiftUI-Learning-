//
//  TuesdayUIDesignViewModel5.swift
//  SwiftUI-Designing-Learning
//
//  Created by Apple on 05/11/2024.
//

import Foundation
import SwiftUI
import AVKit

class TuesdayUIDesignViewModel5: ObservableObject{
    
    @Published var currentTime: TimeInterval = 0.0
    @Published var duration: TimeInterval = 1.0
    @Published var progress: Double = 0.0
    @Published var timer: Timer?
    var musicPlayer: AVAudioPlayer?
    
    @Published var musicDataList: [TuesdayUIDesignDataModel5] = [
        TuesdayUIDesignDataModel5(songName: "Tada_mp3", songURLString: "Tada"),
        TuesdayUIDesignDataModel5(songName: "Badum_mp3", songURLString: "Badum"),
        TuesdayUIDesignDataModel5(songName: "groovyhiphop_mp3", songURLString: "groovyhiphop")
    ]
    
//    enum MusicOptions: String {
//        case Tada
//        case Badum
//        case groovyhiphop
//    }
    
    func playMusic(music: String ,playAndPause: Bool){
        
        guard let url = Bundle.main.url(forResource: music, withExtension: ".mp3") else {return}
        
        do{
            musicPlayer = try AVAudioPlayer(contentsOf: url)
            duration = musicPlayer?.duration ?? 0.1
            if playAndPause == true{
                musicPlayer?.play()
            }else{
                musicPlayer?.pause()
            }
            
        }catch let error {
            print("Error on Music\(error.localizedDescription)")
        }
        
    }
    
    // This func will start the timer(currentTime) of the current song and give value to the progress
    func startTimer(){
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [self] _ in
            guard let audioPlayer = musicPlayer else { return }
            currentTime = audioPlayer.currentTime
            progress = currentTime / duration
        }
    }
    
    // This func will stop the timer
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func formatTime(_ time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
}
