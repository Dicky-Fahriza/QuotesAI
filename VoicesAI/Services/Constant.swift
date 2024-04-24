//
//  Constant.swift
//  VoicesAI
//
//  Created by MacBook Pro on 24/04/24.
//

import Foundation

struct Constant {
    static let baseURL = "https://api.elevenlabs.io/"
    static let appVersion = "v1"
    
    enum EndPoint: String {
        case textToSpeech = "text-to-speech"
        case speechToSpeech = "speech-to-speech"
    }
    
    enum VoiceID: String {
        case simeon = "alMSnmMfBQWEfTP8MRcX"
        case annie = "b7sHDX3W3fwhahzkGMyw"
    }
    
    /// let urlString = Constant.fallurl(forVoice: .annie)
    ///
    
    static func fullURL(forVoice voice: VoiceID) -> String {
        let results = baseURL + appVersion + "/" +  EndPoint.textToSpeech.rawValue + "/" + voice.rawValue
        
        return results
    }
}
