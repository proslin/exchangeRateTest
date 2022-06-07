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
    
    func currencyNameFormatter() -> String {
        guard let index = self.firstIndex(of: "/") else { return self }
        
        var newStr = self
        newStr.insert(contentsOf: "\n", at: self.index(index, offsetBy: 2))
        
        return newStr
    }
    
    func formattedPrice(currencyCode: String) -> String {

        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 2
        switch currencyCode {
        case CurrencyCodes.rur.rawValue:
            formatter.currencySymbol = "₽ "
        case CurrencyCodes.usd.rawValue:
            formatter.currencySymbol = "$ "
        case CurrencyCodes.chf.rawValue:
            formatter.currencySymbol = "₣ "
        case CurrencyCodes.eur.rawValue:
            formatter.currencySymbol = "€ "
        case CurrencyCodes.gbp.rawValue:
            formatter.currencySymbol = "£ "
        default:
            formatter.currencySymbol = ""
        }
        let numberString = formatter.string(from: NSNumber(value: self.convertToDouble())) ?? "-"
        let string = "\(numberString)"
        return string
}

}
