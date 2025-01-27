//
//  GameVC.swift
//  GodsUnion
//
//  Created by 1 on 27/01/25.
//

import UIKit
import SnapKit

class GameVC: UIViewController {
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var leftGodImage: UIImageView!
    @IBOutlet weak var chapterTextImage: UIImageView!
    @IBOutlet weak var intuitionLabel: UILabel!
    @IBOutlet weak var kindnessLabel: UILabel!
    @IBOutlet weak var knowledgeLabel: UILabel!
    @IBOutlet weak var propertiesStack: UIStackView!
    @IBOutlet weak var questionBackImage: UIImageView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var gameView: UIView!
    @IBOutlet var answersLabels: [UILabel]!
    @IBOutlet var propertiesStackOutletCollection: [UIStackView]!
    @IBOutlet weak var backImage: UIImageView!
    @IBOutlet var answerButtons: [UIButton]!
    @IBOutlet weak var answersStack: UIStackView!
    
    var chapter: Int?
    var index: Int?
    var testData: TestData?
    let propertyImageNames: [String] = ["intuitionCoin", "heartCoin", "knowledgeCoin"]
    let userDetaultsKey: [String] = ["intuition", "kindness", "knowledge"]
    let chapterKeys = ["firstChapterPause", "secondChapterPause", "thirdChapterPause"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialAppearance()
        setupQuestion()
    }
    
    @IBAction func answerPressed(_ sender: UIButton) {
        for btn in answerButtons {
            btn.isUserInteractionEnabled = false
        }
        sender.backgroundColor = UIColor.init(white: 0, alpha: 0.25)
        
        if let chapter = chapter, let index = index {
            var currentTrophies = GameManager.shared.getValueOfKey(key: GameManager.shared.tropies) as! [Int]
            if chapter == 0 && sender.tag == 1 && !currentTrophies.contains(0) && index == 0 {
                currentTrophies.append(0)
                GameManager.shared.updateToGivenValues(key: GameManager.shared.tropies,
                                                       value: currentTrophies)
            } else if chapter == 0 && !currentTrophies.contains(1) && index == 1 {
                currentTrophies.append(1)
                GameManager.shared.updateToGivenValues(key: GameManager.shared.tropies,
                                                       value: currentTrophies)
            } else if chapter == 0 && sender.tag == 0 && !currentTrophies.contains(2) && index == 2 {
                currentTrophies.append(2)
                GameManager.shared.updateToGivenValues(key: GameManager.shared.tropies,
                                                       value: currentTrophies)
            } else if chapter == 1 && !currentTrophies.contains(3) && index == 6 {
                currentTrophies.append(3)
                GameManager.shared.updateToGivenValues(key: GameManager.shared.tropies,
                                                       value: currentTrophies)
            } else if chapter == 2 && !currentTrophies.contains(4) && index == 2 && sender.tag == 2 {
                currentTrophies.append(4)
                GameManager.shared.updateToGivenValues(key: GameManager.shared.tropies,
                                                       value: currentTrophies)
            } else if chapter == 2 && !currentTrophies.contains(5) && index == 3 && sender.tag == 0 {
                currentTrophies.append(5)
                GameManager.shared.updateToGivenValues(key: GameManager.shared.tropies,
                                                       value: currentTrophies)
            }
        }
        
        if index! < 6 {
            let randomValueToPass = Int.random(in: 0...2)
            setupRandomCoin(passedValue: randomValueToPass, tappedButton: sender, valueToAdd: 1)
        } else {
            setupRandomCoin(passedValue: sender.tag, tappedButton: sender, valueToAdd: 5)
        }
    }
    
    @IBAction func pausePressed(_ sender: UIButton) {
        if let chapter = chapter, let index = index {
            GameManager.shared.updateToGivenValues(key: chapterKeys[chapter], value: index)
            navigationController?.popToRootViewController(animated: true)
        }
    }
}
private extension GameVC {
    private func setupInitialAppearance() {
        if let chapter = chapter {
            testData = TestData.fetchTestData()[chapter]
            chapterTextImage.image = UIImage(named: "chapter\(chapter + 1)TextImage")
            backImage.image = UIImage(named: "chapter\(chapter + 1)Back")
            showProperties()
        }
    }
    
    private func showProperties() {
        knowledgeLabel.text = "KNOWLEDGE: \(GameManager.shared.getKnowledge())"
        intuitionLabel.text = "INTUITION: \(GameManager.shared.getIntuition())"
        kindnessLabel.text = "KINDNESS: \(GameManager.shared.getKindness())"
    }
    
    private func setupQuestion() {
        if let index = index, let testData = testData {
            let question = testData.questions[index]
            if index > 5 {
                chapterTextImage.image = UIImage(named: "finalChoiceTextImage")
                for propertiesStack in propertiesStackOutletCollection {
                    propertiesStack.isHidden = false
                }
            } else {
                questionBackImage.image = UIImage(named: "natureImage\(index)")
            }
            questionLabel.text = question.question
            for lbl in answersLabels {
                switch lbl.tag {
                case 0:
                    lbl.text = question.firstAnswer
                case 1:
                    lbl.text = question.secondAnswer
                case 2:
                    lbl.text = question.thirdAnswer
                default:
                    break
                }
            }
        }
    }
    
    private func setupRandomCoin(passedValue: Int, tappedButton: UIButton, valueToAdd: Int) {
        let buttonLength = Float((answersStack.frame.width / 3) + 20)
        let constantAddition: Float = 20.0
        let stack = UIStackView()
        let label: UILabel = {
            let label = UILabel()
            label.font = UIFont(name: "Yeast22-Regular", size: 25)
            label.textColor = .white
            label.text = "+\(valueToAdd)"
            return label
        }()
        let image = UIImageView(image: UIImage(named: propertyImageNames[passedValue]))
        
        gameView.addSubview(stack)
        stack.alpha = 1.0
        stack.snp.makeConstraints { make in
            make.bottom.equalTo(answersStack.snp.top).offset(-10)
            make.left.equalTo((buttonLength * Float(tappedButton.tag)) + (constantAddition * Float(tappedButton.tag)))
        }
        stack.addArrangedSubview(label)
        stack.addArrangedSubview(image)
        image.snp.makeConstraints { make in
            make.height.width.equalTo(20)
        }
        
        UIView.animate(withDuration: 2.0) {
            stack.alpha = 0
        } completion: { [self]_ in
            stack.removeFromSuperview()
            GameManager.shared.updateToGivenValues(key: userDetaultsKey[passedValue], 
                                                   value: (GameManager.shared.getValueOfKey(key: userDetaultsKey[passedValue]) as! Int) + valueToAdd)
            for btn in answerButtons {
                btn.backgroundColor = .clear
                btn.isUserInteractionEnabled = true
            }
            showProperties()
            if index! < 6 {
                index! += 1
                setupQuestion()
            } else {
                let vc = storyboard?.instantiateViewController(withIdentifier: "FinaleVC") as! FinaleVC
                vc.index = 6
                vc.chapter = chapter
                navigationController?.pushViewController(vc, animated: true)
            }

        }

    }
}
