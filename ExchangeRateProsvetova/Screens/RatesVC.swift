//
//  RatesViewController.swift
//  ExchangeRateProsvetova
//
//  Created by Prosvetova Lina on 29.03.2022.
//

import UIKit

class RatesViewController: UIViewController {
    @IBOutlet weak var loadingDateLabel: UILabel!
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
        }
    }
    
    var activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
    
    let refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh(sender:)), for: .valueChanged)
        return refreshControl
    }()
    
    
    var ratesArray: [Currency] = []
    var selectedIndex: IndexPath = []
    
    //MARK: Life cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
        
        tableView.refreshControl = refreshControl
        
        tableView.register(UINib(nibName: String(describing: CurrencyCellXib.self), bundle: nil), forCellReuseIdentifier: String(describing: CurrencyCellXib.self))
        
        getRates()
        
    }
    
    //MARK: Private methods
//    private func configureLoadingDate(loadingDate: String) {
//        DispatchQueue.main.async {
//            self.loadingDateLabel.text = loadingDate.convertToDisplayFormat()
//        }
//    }
    
    private func getRates() {
        showSpinner()
        
        NetworkManager.shared.getRates() { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.removeSpinner()
            }            
            
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
    
    private func updateUI(with model: Initial) {
        if model.rates.isEmpty {
            presentAlertVC(title: "Список пуст", message: ERError.rateIsEmpty.rawValue)
        } else {
            self.ratesArray = model.rates
            DispatchQueue.main.async {
                self.loadingDateLabel.text = model.downloadDate.convertToDisplayFormat()
                self.tableView.reloadData()
                self.view.bringSubviewToFront(self.tableView)
            }
        }
    }
    
    @objc func refresh(sender: UIRefreshControl) {
        getRates()
    }
}

//MARK: - UITableViewDataSource
extension RatesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ratesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CurrencyCellXib.self)) as! CurrencyCellXib
        let currencyRate = ratesArray[indexPath.row]
        cell.set(currency: currencyRate)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        indexPath == selectedIndex ? 115 : 70
    }
}

//MARK: - UITableViewDelegate
extension RatesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if selectedIndex != indexPath {
            selectedIndex = indexPath
        } else {
            selectedIndex = []
        }
        
        tableView.performBatchUpdates(nil)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        tableView.performBatchUpdates(nil)
    }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.contentView.layer.masksToBounds = true
    }
}
