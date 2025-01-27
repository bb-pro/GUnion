//
//  ChapterSelectionVC.swift
//  GodsUnion
//
//  Created by 1 on 26/01/25.
//

import UIKit
import SnapKit

class ChapterSelectionVC: UIViewController {
    @IBOutlet weak var leftButtonOutlet: UIButton!
    @IBOutlet weak var rightButtonOutlet: UIButton!
    @IBOutlet weak var continueButtonOutlet: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var backImageView: UIImageView!
    @IBOutlet weak var chapterGodImage: UIImageView!
    
    var index = 0
    let keys = ["firstChapterPause", "secondChapterPause", "thirdChapterPause"]
    var chapterDesctiptions: [String] = ["""
Chapter 1:
The return of joy and
harmony to Olympus
""", """
Chapter 2:
Food is life for everyone,
even for the gods
""", """
Chapter 3:
Am I a god for people or for
other gods?
"""
    ]
    lazy var lockedView = UIView()
    lazy var backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "backButton"), for: .normal)
        return button
    }()
    lazy var lockedLeftButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "leftIcon"), for: .normal)
        return button
    }()
    lazy var lockedRightButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "rightIcon"), for: .normal)
        return button
    }()
    lazy var titleTextImage = UIImageView(image: UIImage(named: "chooseChapterText"))
    lazy var lockedLabel: UILabel = {
        let label = UILabel()
        label.text = "LOCKED"
        label.font = UIFont(name: "Yeast22-Regular", size: 80)
        label.textColor = UIColor(red: 230/255, green: 206/255, blue: 137/255, alpha: 1)
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUserAppearance()
    }
    
    @IBAction func backTapped(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func leftButton(_ sender: UIButton) {
        if index >= 1 {
            index -= 1
            setupUserAppearance()
        }
    }
    
    @IBAction func rightButton(_ sender: UIButton) {
        if index <= 1 {
            index += 1
            setupUserAppearance()
        }
    }
    
    @IBAction func newButtonTapped(_ sender: UIButton) {
        SoundManager.shared.stopBackgroundMusic()
        switch index {
        case 0:
            SoundManager.shared.playFirstChapterMusic()
        case 1:
            SoundManager.shared.playSecondChapterMusic()
        case 2:
            SoundManager.shared.playThirdChapterMusic()
        default:
            break
        }
        let vc = storyboard?.instantiateViewController(withIdentifier: "LoadingTestVC") as! LoadingTestVC
        vc.level = index
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func continueButtonTapped(_ sender: UIButton) {
        let value = GameManager.shared.getValueOfKey(key: keys[index]) as? Int
        if let value = value {
            SoundManager.shared.stopBackgroundMusic()
            switch index {
            case 0:
                SoundManager.shared.playFirstChapterMusic()
            case 1:
                SoundManager.shared.playSecondChapterMusic()
            case 2:
                SoundManager.shared.playThirdChapterMusic()
            default:
                break
            }
            switch value {
            case 0...5:
                let vc = storyboard?.instantiateViewController(withIdentifier: "GameVC") as! GameVC
                vc.index = value
                vc.chapter = index
                navigationController?.pushViewController(vc, animated: true)
            case 6...8:
                let vc = storyboard?.instantiateViewController(withIdentifier: "FinaleVC") as! FinaleVC
                vc.index = value
                vc.chapter = index
                navigationController?.pushViewController(vc, animated: true)
            default:
                break
            }
        }
    }
}
private extension ChapterSelectionVC {
    private func setupUserAppearance() {
        if index >= 0 && index <= 2 {
            descriptionLabel.text = chapterDesctiptions[index]
            chapterGodImage.image = UIImage(named: "chapter\(index + 1)God")
            backImageView.image = UIImage(named: "chapter\(index + 1)Back")
        }
        
        leftButtonOutlet.isEnabled = (index > 0)
        rightButtonOutlet.isEnabled = (index < 2)
        
        if index > (GameManager.shared.getValueOfKey(key: GameManager.shared.passedLevels) as! Int) {
            if lockedView.superview == nil {
                setupLockedView()
            }
        } else {
            if lockedView.superview != nil {
                lockedView.removeFromSuperview() 
            }
        }
        
        if UserDefaults.standard.value(forKey: keys[index]) == nil {
            continueButtonOutlet.isEnabled = false
        } else {
            continueButtonOutlet.isEnabled = true
        }
    }
    
    private func setupLockedView() {
        view.addSubview(lockedView)
        lockedView.backgroundColor = UIColor.init(white: 0, alpha: 0.7)
        lockedView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        lockedView.addSubview(backButton)
        backButton.addHapticAction {
            self.navigationController?.popToRootViewController(animated: true)
        }
        backButton.snp.makeConstraints { make in
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(5)
            make.top.equalToSuperview().inset(20)
            make.width.height.equalTo(50)
        }
        
        lockedView.addSubview(titleTextImage)
        titleTextImage.contentMode = .scaleAspectFit
        titleTextImage.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.height.equalTo(70)
            make.left.right.equalToSuperview().inset(80)
        }
        
        lockedView.addSubview(lockedLabel)
        lockedLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        lockedView.addSubview(lockedLeftButton)
        lockedLeftButton.addHapticAction {
            if self.index >= 1 {
                self.index -= 1
                self.setupUserAppearance()
            }
        }
        lockedLeftButton.snp.makeConstraints { make in
            make.height.width.equalTo(50)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-5)
            make.centerX.equalToSuperview().offset(-130)
        }
        
        lockedView.addSubview(lockedRightButton)
        lockedRightButton.addHapticAction {
            if self.index <= 1 {
                self.index += 1
                self.setupUserAppearance()
            }
        }
        lockedRightButton.snp.makeConstraints { make in
            make.height.width.equalTo(50)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-5)
            make.centerX.equalToSuperview().offset(130)
        }
    }
}
