//
//  GameManager.swift
//  GodsUnion
//
//  Created by 1 on 27/01/25.
//

import Foundation

class GameManager {
    static let shared = GameManager()
    let intuition = "intuition"
    let kindness = "kindness"
    let knowledge = "knowledge"
    let passedLevels = "passedLevels"
    let tropies = "trophies"
    let firstChapterPause = "firstChapterPause"
    let secondChapterPause = "secondChapterPause"
    let thirdChapterPause = "thirdChapterPause"
    private let defaults = UserDefaults.standard
    private init(){}
    
    func initializeValue() {
        if defaults.value(forKey: intuition) == nil {
            defaults.setValue(0, forKey: intuition)
        }
        if defaults.value(forKey: kindness) == nil {
            defaults.setValue(0, forKey: kindness)
        }
        if defaults.value(forKey: knowledge) == nil {
            defaults.setValue(0, forKey: knowledge)
        }
        if defaults.value(forKey: passedLevels) == nil {
            defaults.setValue(0, forKey: passedLevels)
        }
        if defaults.value(forKey: tropies) == nil {
            defaults.setValue([], forKey: tropies)
        }
//        if defaults.value(forKey: firstChapterPause) == nil {
//            defaults.setValue(0, forKey: firstChapterPause)
//        }
//        if defaults.value(forKey: secondChapterPause) == nil {
//            defaults.setValue(0, forKey: secondChapterPause)
//        }
//        if defaults.value(forKey: thirdChapterPause) == nil {
//            defaults.setValue(0, forKey: thirdChapterPause)
//        }
    }
    
    func updateToGivenValues(key: String, value: Any) {
        defaults.setValue(value, forKey: key)
    }
    
    func getValueOfKey(key: String) -> Any {
        return defaults.value(forKey: key) as Any
    }
    
    func getKnowledge() -> Int {
        return defaults.value(forKey: knowledge) as! Int
    }
    
    func getIntuition() -> Int {
        return defaults.value(forKey: intuition) as! Int
    }
    
    func getKindness() -> Int {
        return defaults.value(forKey: kindness) as! Int
    }
}
