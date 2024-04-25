//
//  SpeechVM.swift
//  VoicesAI
//
//  Created by MacBook Pro on 25/04/24.
//

import Foundation
import AVFoundation

@MainActor
class SpeechVM: NSObject, ObservableObject, AVAudioPlayerDelegate {
    @Published var isLoading = false
    @Published var isPlaying =  false
    @Published var errorMessage: String?
    
    private var elevenLabsService: ElevenLabsService?
    private var audioPlayer: AVAudioPlayer?
    
    // MARK: - GENERATE AND PLAY
    func generateAndPlaySpeech(from text: String, apiKey: String)
    async {
        isLoading = true
        errorMessage = nil
        errorMessage =  nil
        
        elevenLabsService = ElevenLabsService(apiKey: apiKey)
        
        do {
            guard let audioData = try await
                elevenLabsService?.generateSpeech(for: text) else {
                errorMessage = "Failed to generate audio data."
                print(errorMessage as Any)
                return
            }
             playAudio(from: audioData)
        } catch {
            print("Error generating or playing speech: \(error)")
        }
        
    }
}


// MARK: - FUNCTION PLAY AUDIO
extension SpeechVM {
    func playAudio(from data: Data) {
        do {
            audioPlayer = try AVAudioPlayer(data: data)
            audioPlayer?.delegate =  self
            isPlaying = true
            audioPlayer?.play()
            
        } catch {
            print("Audio player error: \(error)")
        }
    }
}
