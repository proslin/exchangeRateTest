//
//  UIHelper.swift
//  ExchangeRateProsvetova
//
//  Created by Prosvetova Lina on 07.06.2022.
//

import Foundation

enum UIHelper {
    
    static func formattedPrice(value: Double, currencyCode: String) -> String {

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
        let numberString = formatter.string(from: NSNumber(value: value)) ?? "-"
        let string = "\(numberString)"
        return string
    }
}
