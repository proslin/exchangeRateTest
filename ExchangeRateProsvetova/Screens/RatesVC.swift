//
//  RatesViewController.swift
//  ExchangeRateProsvetova
//
//  Created by Prosvetova Lina on 29.03.2022.
//

import UIKit

class RatesViewController: DataLoadingVC {
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
        }
    }
    
    
    let refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh(sender:)), for: .valueChanged)
        return refreshControl
    }()
    
    @IBOutlet weak var loadingDateLabel: UILabel!
    
    var ratesArray: [Currency] = []
    
    var selectedIndex: IndexPath = []
   // var cellShouldGrow: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
        
        tableView.refreshControl = refreshControl
        
        tableView.register(UINib(nibName: String(describing: CurrencyCellXib.self), bundle: nil), forCellReuseIdentifier: String(describing: CurrencyCellXib.self))
        
        getRates()
        
    }
    
    @objc func refresh(sender: UIRefreshControl) {
        getRates()
    }
    
    func configureLoadingDate(loadingDate: String) {
        DispatchQueue.main.async {
            self.loadingDateLabel.text = loadingDate.convertToDisplayFormat()
        }        
    }
    
    func getRates() {
        showLoadingView()

        NetworkManager.shared.getRates() { [weak self] result in
            guard let self = self else { return }
            self.dismissLoadingView()

            switch result {
            case .success(let model):
                self.updateUI(with: model)
                DispatchQueue.main.async {
                  self.refreshControl.endRefreshing()
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.presentAlertVC(title: "Ошибка", message: error.rawValue)
                }
                return
            }
        }
    }
 
    func updateUI(with model: Initial) {
        
        if model.rates.isEmpty {
            presentAlertVC(title: "Список пуст", message: ERError.rateIsEmpty.rawValue)
        } else {
            self.ratesArray = model.rates
            DispatchQueue.main.async {
                self.loadingDateLabel.text = model.downloadDate
                self.tableView.reloadData()
                self.view.bringSubviewToFront(self.tableView)
            }
        }
    }
    
    
}


extension RatesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ratesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CurrencyCellXib.self)) as! CurrencyCellXib
       // let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyCell", for: indexPath) as! CurrencyCell
        let currencyRate = ratesArray[indexPath.row]
        cell.set(currency: currencyRate)

        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        indexPath == selectedIndex ? 130 : 70
    }
}

extension RatesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        selectedIndex != indexPath ? (selectedIndex = indexPath) : (selectedIndex = [])
        
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.contentView.layer.masksToBounds = true
    }
}
