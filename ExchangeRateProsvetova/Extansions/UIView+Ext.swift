//
//  UIView+Ext.swift
//  ExchangeRateProsvetova
//
//  Created by Prosvetova Lina on 29.04.2022.
//

import UIKit

extension UIView {
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        
    }
    
//    func applyBlurEffect() {
//        let blurEffect = UIBlurEffect(style: .systemUltraThinMaterial)
//        let blurEffectView = UIVisualEffectView(effect: blurEffect)
//        blurEffectView.frame = bounds
//        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//
//        let activityIndicator = UIActivityIndicatorView(style: .large)
//        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
//
//        addSubview(blurEffectView)
//    }
//
//    func removeBlurEffect() {
//        let blurredEffectViews = self.subviews.filter{$0 is UIVisualEffectView}
//        blurredEffectViews.forEach{ blurView in
//            blurView.removeFromSuperview()
//        }
//    }
}
