//
//  SoundManager.swift
//  GodsUnion
//
//  Created by 1 on 27/01/25.
//

import UIKit
import AVFoundation

class SoundManager {
    static let shared = SoundManager()
    var backgroundPlayer: AVAudioPlayer?
    var firstChapterPlayer: AVAudioPlayer?
    var secondChapterPlayer: AVAudioPlayer?
    var thirdChapterPlayer: AVAudioPlayer?
    
    private init() {
        if let bgUrl = Bundle.main.url(forResource: "bg", withExtension: "wav") {
            backgroundPlayer = try? AVAudioPlayer(contentsOf: bgUrl)
            backgroundPlayer?.numberOfLoops = -1
            backgroundPlayer?.prepareToPlay()
        }
        
        if let firstChapterURL = Bundle.main.url(forResource: "firstChoice", withExtension: "mp3") {
            firstChapterPlayer = try? AVAudioPlayer(contentsOf: firstChapterURL)
            firstChapterPlayer?.numberOfLoops = -1
            firstChapterPlayer?.prepareToPlay()
        }
        
        if let secondChapterURL = Bundle.main.url(forResource: "secondChoice", withExtension: "mp3") {
            secondChapterPlayer = try? AVAudioPlayer(contentsOf: secondChapterURL)
            secondChapterPlayer?.numberOfLoops = -1
            secondChapterPlayer?.prepareToPlay()
        }
        if let thirdChapterURL = Bundle.main.url(forResource: "thirdChoice", withExtension: "mp3") {
            thirdChapterPlayer = try? AVAudioPlayer(contentsOf: thirdChapterURL)
            thirdChapterPlayer?.numberOfLoops = -1
            thirdChapterPlayer?.prepareToPlay()
        }
    }
    
    func playBackgroundMusic() {
        backgroundPlayer?.play()
    }

    func stopBackgroundMusic() {
        backgroundPlayer?.stop()
    }
    
    func playFirstChapterMusic() {
        firstChapterPlayer?.play()
    }

    func stopFirstChapterdMusic() {
        firstChapterPlayer?.stop()
    }
    
    func playSecondChapterMusic() {
        secondChapterPlayer?.play()
    }

    func stopSecondChapterdMusic() {
        secondChapterPlayer?.stop()
    }
    
    func playThirdChapterMusic() {
        thirdChapterPlayer?.play()
    }

    func stopThirdChapterdMusic() {
        thirdChapterPlayer?.stop()
    }
    
    func setMusicVolume(_ volume: Float) {
        backgroundPlayer?.volume = volume
    }
    
    func setSoundVolume(_ volume: Float) {
        firstChapterPlayer?.volume = volume
        secondChapterPlayer?.volume = volume
        thirdChapterPlayer?.volume = volume
    }
}

