//
//  TrophyVC.swift
//  GodsUnion
//
//  Created by 1 on 25/01/25.
//

import UIKit

class TrophyVC: UIViewController {
    @IBOutlet var thropiesImages: [UIImageView]!
    
    let availableTrophies = GameManager.shared.getValueOfKey(key: GameManager.shared.tropies) as! [Int]
    override func viewDidLoad() {
        super.viewDidLoad()
        for trophyImage in thropiesImages {
            if availableTrophies.contains(trophyImage.tag) {
                trophyImage.image = UIImage(named: "thropy\(trophyImage.tag)s")
            } else {
                trophyImage.image = UIImage(named: "thropy\(trophyImage.tag)")
            }
        }
    }
    @IBAction func backTapped(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
}
