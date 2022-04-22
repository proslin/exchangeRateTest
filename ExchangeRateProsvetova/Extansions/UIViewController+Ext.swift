//
//  UIViewController+Ext.swift
//  ExchangeRateProsvetova
//
//  Created by Prosvetova Lina on 21.04.2022.
//

import UIKit

extension UIViewController {

    func presentAlertVC(title: String, message: String) {
          let alertVC = UIAlertController(
                title: title,
                message: message,
                preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertVC.addAction(action)
            present(alertVC, animated: true, completion: nil)
    }
}
