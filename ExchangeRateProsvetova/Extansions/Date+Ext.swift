//
//  Date+Ext.swift
//  ExchangeRateProsvetova
//
//  Created by Prosvetova Lina on 06.04.2022.
//

import UIKit

extension Date {
        func convertToDayTimeFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMMM HH:mm:ss"
        dateFormatter.locale = Locale(identifier: "ru_RU")
            
        return dateFormatter.string(from: self)        
    }
}
