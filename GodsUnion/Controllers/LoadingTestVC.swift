//
//  LoadingTestVC.swift
//  GodsUnion
//
//  Created by 1 on 27/01/25.
//

import UIKit

class LoadingTestVC: UIViewController {
    @IBOutlet weak var chapterNumberTextImage: UIImageView!
    @IBOutlet weak var chapterInfoView: UIView!
    @IBOutlet weak var chapterInfoLabel: UILabel!
    @IBOutlet weak var intuitionLabel: UILabel!
    @IBOutlet weak var kindnessLabel: UILabel!
    @IBOutlet weak var knowledgeLabel: UILabel!
    @IBOutlet weak var powersStack: UIStackView!
    @IBOutlet weak var rightGodImageView: UIImageView!
    @IBOutlet weak var backImageView: UIImageView!
    @IBOutlet weak var rightImageConstraint: NSLayoutConstraint!
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var pauseButton: UIButton!
    
    
    var level: Int?
    let infoTexts: [String] = ["I have noticed that Olympus lacks joy and harmony. Athena suggests starting with solving a small problem. I decide to go to Apollo to discuss how to return inspiration to humans. Apollo, the god of arts and prophecies, can help find a way to inspire mortals and bring joy back to their lives.", "I have noticed that Olympus lacks joy and harmony. Athena suggests starting with solving a small problem. I decide to turn to Demeter to restore abundance on Earth. Demeter, the goddess of fertility and agriculture, can help restore the harvest and bring abundance back to the people.", "I have noticed that Olympus lacks joy and harmony. Athena suggests starting with solving a small problem. I decide to visit the mortals to find out what troubles them. Understanding the problems and needs of humans will help find ways to support them and restore harmony on Olympus."]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUserAppearance()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let imageWidth = rightGodImageView.frame.width
        rightImageConstraint.constant = -(imageWidth)
        rightImageConstraint.isActive = true
        rightGodImageView.alpha = 1.0
    }
    
    @IBAction func pauseTapped(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func nextTapped(_ sender: UIButton) {
        powersStack.isHidden = false
        chapterInfoView.isHidden = true
        rightImageConstraint.constant = 0.0
        UIView.animate(withDuration: 3.0, delay: 0, options: .curveEaseInOut) {
            self.view.layoutIfNeeded()
            self.view.alpha = 0.2
        } completion: { [self]_ in
            leftImageView.isHidden = true
            powersStack.isHidden = true
            chapterNumberTextImage.isHidden = true
            chapterInfoView.isHidden = true
            rightGodImageView.isHidden = true
            guard let lvl = level else { return }
            backImageView.image = UIImage(named: "chapter\(lvl)Wisdom")
            
            UIView.animate(withDuration: 3.0) {
                self.pauseButton.alpha = 0.2
                self.backImageView.alpha = 0.2
            } completion: { [self]_ in
                let vc = storyboard?.instantiateViewController(withIdentifier: "GameVC") as! GameVC
                vc.index = 0
                vc.chapter = level
                navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
}
private extension LoadingTestVC {
    private func setupUserAppearance() {
        knowledgeLabel.text = "KNOWLEDGE: \(GameManager.shared.getKnowledge())"
        intuitionLabel.text = "INTUITION: \(GameManager.shared.getIntuition())"
        kindnessLabel.text = "KINDNESS: \(GameManager.shared.getKindness())"
        
        if let level = level {
            chapterInfoLabel.text = infoTexts[level]
            chapterNumberTextImage.image = UIImage(named: "chapter\(level + 1)TextImage")
            backImageView.image = UIImage(named: "chapter\(level + 1)Back")
            rightGodImageView.image = UIImage(named: "chapter\(level + 1)God")
        }
    }
}
