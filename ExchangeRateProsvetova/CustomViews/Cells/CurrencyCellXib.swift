//
//  CurrencyCellXib.swift
//  ExchangeRateProsvetova
//
//  Created by Prosvetova Lina on 19.04.2022.
//

import UIKit

class CurrencyCellXib: UITableViewCell {

    @IBOutlet weak var currencyName: UILabel!
    @IBOutlet weak var flagIV: UIImageView!
    @IBOutlet weak var currencyLetterCode: UILabel!
    
    @IBOutlet weak var currencyBuy: UILabel!
    @IBOutlet weak var detailBuyLabel: UILabel!
    @IBOutlet weak var detailDeltaBuyLabel: UILabel!
    @IBOutlet weak var detailSaleLabel: UILabel!
    @IBOutlet weak var detailDeltaSaleLabel: UILabel!
    var currencyCodeIsHidden = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configure()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10))
    }
        
    private func configure() {
        backgroundColor = .clear
        layer.masksToBounds = false
        layer.shadowOpacity = 0.23
        layer.shadowRadius = 4
        layer.shadowOffset = CGSize(width: 0, height: 1)
        layer.shadowColor = UIColor.systemGray.cgColor
        contentView.backgroundColor = .systemBackground
        contentView.layer.cornerRadius = 20
    }
    
        func formattedPrice(value: Double, currencyCode: String) -> String {
    
            let formatter = NumberFormatter()
            formatter.numberStyle = .currency
            formatter.maximumFractionDigits = 2
            formatter.currencySymbol = currencyCode == "RUR" ? "₽ " : ""
            let numberString = formatter.string(from: NSNumber(value: value)) ?? "-"
            let string = "\(numberString)"
            return string
        }
    
        func currencyNameFormatter(currencyName: String) -> String {
            guard let index = currencyName.firstIndex(of: "/") else { return currencyName }
            
            var newStr = currencyName
            newStr.insert(contentsOf: "\n", at: currencyName.index(index, offsetBy: 2))
            
            return newStr
           
//            if currencyName.isEmpty {
//                return "Нет названия валюты"
//            } else {
//            var formattedCurrencyName = currencyName
//            let index = currencyName.firstIndex(of: "/")
//            guard let indexOpt = index else {
//                currencyCodeIsHidden = false
//                return formattedCurrencyName}
//
//            currencyCodeIsHidden = true
//            formattedCurrencyName.insert(contentsOf: "\n", at: currencyName.index(indexOpt, offsetBy: 2))
//            return formattedCurrencyName
//            }

        }
    
    
    func set(currency: Currency) {
        flagIV.image = UIImage(named: currency.currMnemTo)
        currencyName.textColor  = .gray
        
        if currency.name.contains("/") {
            currencyName.text = currencyNameFormatter(currencyName: currency.name)
            currencyCodeIsHidden = true
        } else {
            currencyName.text = currency.name
        }
        
        //currencyName.text = currencyNameFormatter(currencyName: currency.name)
        
                if currencyCodeIsHidden {
                    currencyLetterCode.text = ""
                } else {
                    currencyLetterCode.textColor = .darkGray
                    if currency.basic.convertToDouble() > 1.0 {
                        currencyLetterCode.text = "\(currency.currMnemTo)    \(currency.basic) единиц "
                    } else {
                        currencyLetterCode.text = currency.currMnemTo
                    }
                }
        
                currencyBuy.textColor = .darkGray
                currencyBuy.text =   formattedPrice(value: currency.buy.convertToDouble(), currencyCode: currency.currMnemFrom)
        
                let deltaBuy = currency.deltaBuy.convertToDouble()
                detailDeltaBuyLabel.textColor = deltaBuy > 0 ? .systemRed : .systemGreen
                detailBuyLabel.text = currency.buy
                detailDeltaBuyLabel.text = currency.deltaBuy
               
                let deltaSale = currency.deltaSale.convertToDouble()
                detailDeltaSaleLabel.textColor = deltaSale > 0 ? .systemRed : .systemGreen
                detailSaleLabel.text = currency.sale
                detailDeltaSaleLabel.text = currency.deltaSale
    }
    
}
