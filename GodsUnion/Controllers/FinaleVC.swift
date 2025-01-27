//
//  FinaleVC.swift
//  GodsUnion
//
//  Created by 1 on 27/01/25.
//

import UIKit

class FinaleVC: UIViewController {
    @IBOutlet weak var leftGodImage: UIImageView!
    @IBOutlet weak var titleTextImage: UIImageView!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var centerView: UIView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var backImage: UIImageView!
    
    var chapter: Int?
    var index: Int?
    let chapterKeys = ["firstChapterPause", "secondChapterPause", "thirdChapterPause"]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    @IBAction func pauseButton(_ sender: UIButton) {
        if let chapter = chapter, let index = index {
            GameManager.shared.updateToGivenValues(key: chapterKeys[chapter], value: index)
            navigationController?.popToRootViewController(animated: true)
        }
    }
    
    @IBAction func nextTapped(_ sender: UIButton) {
        if index! < 8 {
            index! += 1
            setupUI()
        } else {
            let level = GameManager.shared.getValueOfKey(key: GameManager.shared.passedLevels) as! Int
            if level < 2 && level == chapter! {
                GameManager.shared.updateToGivenValues(key: GameManager.shared.passedLevels,
                                                       value: level + 1)
            }
            if let chapter = chapter {
                UserDefaults.standard.setValue(nil, forKey: chapterKeys[chapter])
                navigationController?.popToRootViewController(animated: true)
            }
        }
    }
}
private extension FinaleVC {
    private func setupUI() {
        leftGodImage.alpha = 0
        titleTextImage.alpha = 0
        centerView.alpha = 0
        if let chapter = chapter, let index = index {
            let data = TestData.fetchTestData()[chapter].finales
            infoLabel.text = data[index - 6]
            backImage.image = UIImage(named: "finalGod\(chapter)\(index - 6)")
            
        }
        nextButton.isEnabled = false
        UIView.animate(withDuration: 2.0) {
            self.leftGodImage.alpha = 1.0
            self.titleTextImage.alpha = 1.0
            self.centerView.alpha = 1.0
        } completion: { [self]_ in
            nextButton.isEnabled = true
        }
    }
}
