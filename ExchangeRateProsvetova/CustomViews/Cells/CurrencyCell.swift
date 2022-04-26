////
////  CurrencyCell.swift
////  ExchangeRateProsvetova
////
////  Created by Prosvetova Lina on 31.03.2022.
////
//
//import UIKit
//
//class CurrencyCell: UITableViewCell {
//    @IBOutlet weak var currencyBuy: UILabel!
//   // @IBOutlet weak var currencyFlag: UILabel!
//
//    @IBOutlet weak var currencyLetterCode: UILabel!
//   /// @IBOutlet weak var fromLetterCode: UILabel!
//   // @IBOutlet weak var quantityLabel: UILabel!
//    @IBOutlet weak var currencyName: UILabel!
//   // @IBOutlet weak var currencySale: UILabel!
//
//    @IBOutlet weak var flagImage: UIImageView!
//    @IBOutlet weak var detailView: UIView!
//    //var flags = Flags.allValues
//    @IBOutlet weak var detailViewLabel: UILabel!
//    @IBOutlet weak var detailBuyLabel: UILabel!
//    @IBOutlet weak var detailDeltaBuyLabel: UILabel!
//
//    @IBOutlet weak var detailSaleLabel: UILabel!
//    @IBOutlet weak var detailDeltaSaleLabel: UILabel!
//
//    var currencyCodeFlag = false
//
//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        configure()
//        configureDetailView()
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        configure()
//        configureDetailView()
//    }
//
//    override func layoutSubviews() {
//        super.layoutSubviews()
//
//
//
//        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10))
//    }
//
//    private func configure() {
//
//        backgroundColor = .clear
//        layer.masksToBounds = false
//        layer.shadowOpacity = 0.23
//        layer.shadowRadius = 4
//        layer.shadowOffset = CGSize(width: 0, height: 1)
//        layer.shadowColor = UIColor.systemGray.cgColor //   sblack.cgColor
//
//        contentView.backgroundColor = .systemBackground
//        contentView.layer.cornerRadius = 20
//
//       // currencyFlag.font = UIFont.systemFont(ofSize: 36)
//
//    }
//
//    func configureDetailView() {
//       // detailView.backgroundColor = .systemGreen
//       // detailViewLabel.text = "Нажали"
//       // detailView.isHidden = true
//    }
//
//    func formattedPrice(value: Double, currencyCode: String) -> String {
//
//        let formatter = NumberFormatter()
//        formatter.numberStyle = .currency
//        formatter.maximumFractionDigits = 2
//        formatter.currencySymbol = currencyCode == "RUR" ? "₽ " : ""
//        let numberString = formatter.string(from: NSNumber(value: value)) ?? "-"
//        let string = "\(numberString)"
//        return string
//    }
//
//    func currencyNameFormatter(currencyname: String?) -> String {
//        guard var currencyname = currencyname else { return "name N/A" }
//
//        var index = currencyname.firstIndex(of: "/")
//
//        guard let indexOpt = index else {
//            currencyCodeFlag = false
//            return currencyname}
//       // let optInd = String.Index(encodedOffset: <#Int#>)
//        //if index != nil {
//            currencyCodeFlag = true
//        //currencyname.remove(at: currencyname.index(after: indexOpt))
//        currencyname.insert(contentsOf: "\n", at: currencyname.index(after: indexOpt))
//            return currencyname
////        } else {
////            currencyCodeFlag = false
////            return currencyname }
//    }
//
//    func set(currency: Currency) {
//
//        flagImage.image = UIImage(named: currency.currMnemTo)
//       // currencyName.font = UIFont.systemFont(ofSize: 17, weight: .light)
//        currencyName.text?.lineSpaced(0.75)
//        currencyName.textColor  = .gray
//
//
//        let  newString = currencyNameFormatter(currencyname: currency.name)
//        currencyName.text = newString
//
//        if currencyCodeFlag {
//            currencyLetterCode.text = ""
//        } else {
//        currencyLetterCode.textColor = .darkGray
//        //fromLetterCode.textColor = .secondaryLabel
//        print(currency.basic.convertToDouble())
//            if currency.basic.convertToDouble() > 1.0 {
//                currencyLetterCode.text = "\(currency.currMnemTo)    \(currency.basic) "
//            } else {
//        currencyLetterCode.text = currency.currMnemTo
//            }
//        //fromLetterCode.text = currency.currMnemFrom
//      //  quantityLabel.text = currency.basic
//        }
//
//        currencyBuy.textColor = .darkGray
//        currencyBuy.text =   formattedPrice(value: currency.buy.convertToDouble(), currencyCode: currency.currMnemFrom)
//
//
//        let deltaBuy = currency.deltaBuy.convertToDouble()
//        detailDeltaBuyLabel.textColor = deltaBuy > 0 ? .systemRed : .systemGreen
//        detailBuyLabel.text = currency.buy
//        detailDeltaBuyLabel.text = currency.deltaBuy
//        let deltaSale = currency.deltaSale.convertToDouble()
//        detailDeltaSaleLabel.textColor = deltaSale > 0 ? .systemRed : .systemGreen
//        detailSaleLabel.text = currency.sale
//        detailDeltaSaleLabel.text = currency.deltaSale
//       // currencySale.text = currency.sale
//    }
//}
