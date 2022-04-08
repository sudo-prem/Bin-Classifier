//
//  SoundManager.swift
//  Sort and Classify
//
//  Created by Premnaath Varadharajan on 08/04/22.
//

import AVKit

public class SoundManager {
    
    // Singleton
    public static let instance = SoundManager()
    public var player: AVAudioPlayer?
    public enum SoundOption: String {
        case tada
        case beep
        case button
        case arbutton
        case whoosh
        case bell
    }
    
    // Function to play sound, given the sound name
    public func playSound(sound: SoundOption) {
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else { return }
        
        // Throws exception, if file not found
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("Error playing sound: \(error.localizedDescription)")
        }
    }
}
