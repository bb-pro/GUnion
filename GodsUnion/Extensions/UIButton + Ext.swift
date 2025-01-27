//
//  UIButton + Ext.swift
//  GodsUnion
//
//  Created by 1 on 25/01/25.
//

import UIKit

extension UIButton {
    func addHapticAction(_ action: @escaping () -> Void) {
        self.addAction(.init(handler: { _ in
            let impactMedia = UIImpactFeedbackGenerator(style: .medium)
            impactMedia.impactOccurred()
            action()
        }), for: .touchUpInside)
    }
}
