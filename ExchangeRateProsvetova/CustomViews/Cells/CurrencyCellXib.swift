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
    @IBOutlet var collapsetConstraint: NSLayoutConstraint!
    @IBOutlet var expandedConstraint: NSLayoutConstraint!
    var currencyCodeIsHidden = false
    
    override var isSelected: Bool {
        didSet {
            updateAppearance()
        }
    }
    
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
        
    func updateAppearance() {
        collapsetConstraint.isActive = !isSelected
        expandedConstraint.isActive = isSelected
    }
    
    private func configure() {
        backgroundColor = .clear
        self.dropShadow(color: .systemGray, opacity: 0.23, offSet: CGSize(width: 0, height: 1), radius: 4, scale: true)
        
        contentView.backgroundColor = .systemBackground
        contentView.layer.cornerRadius = 20
        
        updateAppearance()
    }
    
    
    func set(currency: Currency) {
        flagIV.image = UIImage(named: currency.currMnemTo)
        if currency.name.contains("/") {
            currencyName.text = currency.name.currencyNameFormatter()
            currencyCodeIsHidden = true
        } else {
            currencyName.text = currency.name
            currencyCodeIsHidden = false
        }
        
                if currencyCodeIsHidden {
                    currencyLetterCode.text = ""
                } else {
                    if currency.basic.convertToDouble() > 1.0 {
                        currencyLetterCode.text = "\(currency.currMnemTo)    \(currency.basic) единиц "
                    } else {
                        currencyLetterCode.text = currency.currMnemTo
                    }
                }

        currencyBuy.text = currency.buy.formattedPrice(currencyCode: currency.currMnemFrom)
    
        
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
