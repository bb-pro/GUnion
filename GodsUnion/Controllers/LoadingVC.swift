//
//  ViewController.swift
//  GodsUnion
//
//  Created by 1 on 25/01/25.
//

import UIKit
import SnapKit

class LoadingVC: UIViewController {
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var rightImageView: UIImageView!
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var loadingLabel: UILabel!
    @IBOutlet weak var backImageView: UIImageView!
    
    let main = UIStoryboard(name: "Main", bundle: nil)
    var timer: Timer?
    var progress: Float = 0.0
    var index = 0
    lazy var topTitleImage = UIImageView(image: UIImage(named: "prehistoryTextImage"))
    lazy var centerView = UIView()
    lazy var viewImage = UIImageView(image: UIImage(named: "loadingCenterImage0"))
    lazy var nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "nextButton"), for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressView.progress = progress
        progressView.layer.masksToBounds = true
        progressView.layer.borderWidth = 3.0
        progressView.layer.borderColor = UIColor.black.cgColor
        startAnimation()
    }
    
    private func startAnimation() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            self.progress += 0.01
            self.progressView.setProgress(self.progress, animated: true)
            if self.progress >= 1.0 {
                self.timer?.invalidate()
                self.setupOnboardingAppearance()
            }
        }
    }
}
private extension LoadingVC {
    private func setupOnboardingAppearance() {
        rightImageView.isHidden = true
        progressView.isHidden = true
        loadingLabel.isHidden = true
        leftImageView.isHidden = false
        view.addSubview(topTitleImage)
        topTitleImage.contentMode = .scaleAspectFit
        topTitleImage.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(50)
        }
        
        view.addSubview(centerView)
        centerView.snp.makeConstraints { make in
            make.centerX.equalToSuperview().offset(70)
            make.top.equalTo(topTitleImage.snp.bottom).offset(25)
            make.bottom.equalToSuperview().inset(30)
            make.width.equalTo(centerView.snp.height).multipliedBy(1.84)
        }
        centerView.addSubview(viewImage)
        viewImage.contentMode = .scaleAspectFit
        viewImage.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(viewImage.snp.width).dividedBy(2.12)
        }
        
        centerView.addSubview(nextButton)
        nextButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
            make.top.equalTo(viewImage.snp.bottom).offset(-15)
            make.width.equalTo(nextButton.snp.height)
        }
        nextButton.addHapticAction {
            self.index += 1
            if self.index == 3 {
                self.fadedEffect()
            } else if self.index > 1 {
                self.viewImage.image = UIImage(named: "loadingCenterImage\(self.index)")
                self.rightImageView.isHidden = false
                self.leftImageView.isHidden = true
                self.centerView.snp.updateConstraints { make in
                    make.centerX.equalToSuperview().offset(-70)
                }
            } else {
                self.viewImage.image = UIImage(named: "loadingCenterImage\(self.index)")
            }
        }
    }
    
    private func fadedEffect() {
        rightImageView.isHidden = true
        topTitleImage.isHidden = true
        centerView.isHidden = true
        backImageView.image = UIImage(named: "fadableLoadingImage")
        UIView.animate(withDuration: 3.0) {
            self.backImageView.alpha = 0.2
        } completion: { _ in
            let vc = self.main.instantiateViewController(withIdentifier: "MainNavBar")
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
    }
}

