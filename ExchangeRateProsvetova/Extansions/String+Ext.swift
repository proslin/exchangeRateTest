//
//  String+Ext.swift
//  ExchangeRateProsvetova
//
//  Created by Prosvetova Lina on 07.04.2022.
//

import UIKit

extension String {
    func convertToDouble() -> Double {
        (self as NSString).doubleValue
    }
    
    func convertToDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.timeZone = .current
        
        return dateFormatter.date(from: self)
    }
    
    func convertToDisplayFormat() -> String {
        guard let date = self.convertToDate() else { return "N/A"}
        
        return date.convertToDayTimeFormat()
    }
    
}

