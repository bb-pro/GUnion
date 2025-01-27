//
//  RootVC.swift
//  GodsUnion
//
//  Created by 1 on 25/01/25.
//

import UIKit

class RootVC: UIViewController {
    @IBOutlet weak var intuitionLabel: UILabel!
    @IBOutlet weak var kindnessLabel: UILabel!
    @IBOutlet weak var knowledgeLabel: UILabel!
    @IBOutlet weak var gameNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        knowledgeLabel.text = "KNOWLEDGE: \(GameManager.shared.getKnowledge())"
        intuitionLabel.text = "INTUITION: \(GameManager.shared.getIntuition())"
        kindnessLabel.text = "KINDNESS: \(GameManager.shared.getKindness())"
        SoundManager.shared.stopFirstChapterdMusic()
        SoundManager.shared.stopSecondChapterdMusic()
        SoundManager.shared.stopThirdChapterdMusic()
        SoundManager.shared.playBackgroundMusic()
    }
    
    @IBAction func playTapped(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ChapterSelectionVC") as! ChapterSelectionVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func trophiesTapped(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "TrophyVC") as! TrophyVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func soundTapped(_ sender: UIButton) {
        if sender.tag == 0 {
            sender.tag = 1
            sender.setBackgroundImage(UIImage(named: "soundOff"), for: .normal)
            SoundManager.shared.setSoundVolume(0.0)
        } else {
            sender.tag = 0
            sender.setBackgroundImage(UIImage(named: "soundOn"), for: .normal)
            SoundManager.shared.setSoundVolume(1.0)
        }
    }
    
    @IBAction func musicTapped(_ sender: UIButton) {
        if sender.tag == 0 {
            sender.tag = 1
            sender.setBackgroundImage(UIImage(named: "musicOff"), for: .normal)
            SoundManager.shared.setMusicVolume(0.0)
        } else {
            sender.tag = 0
            sender.setBackgroundImage(UIImage(named: "musicOn"), for: .normal)
            SoundManager.shared.setMusicVolume(1.0)
        }
    }
}
