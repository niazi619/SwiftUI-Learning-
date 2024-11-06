//
//  MusicProgressBarView.swift
//  SwiftUI-Designing-Learning
//
//  Created by Apple on 06/11/2024.
//

//import SwiftUI
//
//struct MusicProgressBarView: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}
//
//struct MusicProgressBarView_Previews: PreviewProvider {
//    static var previews: some View {
//        MusicProgressBarView()
//    }
//}

import SwiftUI
import AVKit

struct PlayerView: View {
    @State private var audioPlayer: AVAudioPlayer?
    @State private var isPlaying = false
    @State private var currentTime: TimeInterval = 0.0
    @State private var duration: TimeInterval = 1.0 // Avoid division by zero
    @State private var progress: Double = 0.0
    @State private var timer: Timer?
    @State var music: String = ""

    @State private var currentSongIndex = 0
    @State private var backwardButtonDisable = false
    @State private var forwardButtonDisable = false

    @ObservedObject var vm = TuesdayUIDesignViewModel5()
    
    // Replace `vm.musicDataList[currentSongIndex].songTime` with the actual duration formatting
    var songDuration: String {
        let minutes = Int(duration) / 60
        let seconds = Int(duration) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }

    var body: some View {
        ZStack{
            Color.purple
            VStack(spacing: 30) {
                // Progress Bar and Time Labels
                HStack {
                    Text(formatTime(currentTime))
                        .font(.system(size: 13))
                        .foregroundColor(.white)

                    ZStack(alignment: .leading) {
                        Capsule().fill(Color("customDeepGray"))
                            .frame(width: 250, height: 5)
                        
                        Capsule().fill(Color("customPurple"))
                            .frame(width: CGFloat(progress) * 250, height: 7)
                    }
                    
                    Text(songDuration)
                        .font(.system(size: 13))
                        .foregroundColor(.white)
                }

                // Control Buttons
                HStack(spacing: 45) {
                    Button(action: {
                        currentSongIndex = max(currentSongIndex - 1, 0)
                        forwardButtonDisable = false
                        backwardButtonDisable = currentSongIndex == 0
                        // Implement logic to play the previous song
                    }, label: {
                        Image(systemName: "backward.fill")
                            .resizable()
                            .frame(width: 25, height: 18)
                            .foregroundColor(backwardButtonDisable ? .gray : .white)
                    })
                    .disabled(backwardButtonDisable)

                    Button(action: {
                        isPlaying.toggle()
                        if isPlaying {
                            music = vm.musicDataList[currentSongIndex].songURLString
                            audioPlayer?.play()
                            startTimer()
                        } else {
                            audioPlayer?.pause()
                            stopTimer()
                        }
                    }, label: {
                        Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                            .resizable()
                            .frame(width: 23, height: 23)
                            .foregroundColor(.white)
                            .background(Color("customPurple"))
                            .clipShape(Circle())
                            .frame(width: 80, height: 80)
                    })

                    Button(action: {
                        currentSongIndex = min(currentSongIndex + 1, vm.musicDataList.count - 1)
                        backwardButtonDisable = false
                        forwardButtonDisable = currentSongIndex == vm.musicDataList.count - 1
                        // Implement logic to play the next song
                    }, label: {
                        Image(systemName: "forward.fill")
                            .resizable()
                            .frame(width: 25, height: 18)
                            .foregroundColor(forwardButtonDisable ? .gray : .white)
                    })
                    .disabled(forwardButtonDisable)
                }
            }
        }
        .onAppear {
            setupAudio()
            if currentSongIndex == 0 {
                backwardButtonDisable = true
            }
        }
        .onDisappear {
            stopTimer()
        }
    }

    // MARK: - Audio Player Setup
    func setupAudio() {
        if let url = Bundle.main.url(forResource: music, withExtension: "mp3") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                duration = audioPlayer?.duration ?? 1.0
                audioPlayer?.prepareToPlay()
            } catch {
                print("Error loading audio file: \(error)")
            }
        }
    }

    // MARK: - Timer Management
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            guard let audioPlayer = audioPlayer else { return }
            currentTime = audioPlayer.currentTime
            progress = currentTime / duration
        }
    }

    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }

    // MARK: - Helper Method
    func formatTime(_ time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView()
    }
}
