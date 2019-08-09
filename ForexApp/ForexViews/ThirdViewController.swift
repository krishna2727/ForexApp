//
//  ThirdViewController.swift
//  ForexApp
//
//  Created by fordlabs on 31/07/19.
//  Copyright © 2019 fordlabs. All rights reserved.
//

import UIKit

class ThirdViewController : UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var values: [Double]?
    var keys: [String]?
    
    var currencyCountryCodes = ["AED","AFN","ALL","AMD","ANG","AOA","ARS","AUD","AWG","AZN","BAM","BBD","BDT","BGN","BHD"]
    
    let tableView = UITableView()
    
    
    
    let label: UILabel = {
        let lbl = UILabel()
        lbl.text = "Exchange Rate Caliculator"
        return lbl
    }()
    
    
    let baseCurrency: UITextField = {
        let tx = UITextField()
        tx.placeholder = "from which currency"
        tx.backgroundColor = .green
        tx.text = "USD"
        return tx
    }()
    
    let targetCurrencies: UITextField = {
        let newTextField = UITextField()
        newTextField.placeholder = "to which currency"
        newTextField.backgroundColor = .white
        newTextField.text = "INR,JPY"
        return newTextField
    }()
    
    let getExchangeRates :UIButton = {
        let getExchangeRates = UIButton()
        getExchangeRates.setTitle("GetExchangeRates", for: .normal)
        getExchangeRates.backgroundColor = .black
        return getExchangeRates
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        exchangeRatesBackGroundImage()
        navigationController?.isNavigationBarHidden = false
        setup()
    }
    
    func exchangeRatesBackGroundImage() {
        
        let backGroundImage = UIImageView(frame: UIScreen.main.bounds)
        backGroundImage.image = UIImage(named: "ExchangeRates")
        backGroundImage.contentMode = (UIView.ContentMode.scaleToFill)
        self.view.insertSubview(backGroundImage, at: 0)
    }
    func setup() {
        
        self.view.addSubview(label)
        label.snp.makeConstraints { (make) in
            
            make.top.equalToSuperview().offset(120)
            make.centerX.equalToSuperview()
            
        }
        
        self.view.addSubview(baseCurrency)
        baseCurrency.snp.makeConstraints { (make) in
            
            make.top.equalTo(label.snp.bottom).offset(60)
            make.centerX.equalToSuperview()
            make.height.equalTo(30)
            make.width.equalTo(170)
            
        }
        
        self.view.addSubview(targetCurrencies)
        targetCurrencies.snp.makeConstraints { (make) in
            
            make.top.equalTo(baseCurrency.snp.bottom).offset(60)
            make.centerX.equalToSuperview()
            make.height.equalTo(30)
            make.width.equalTo(170)
        }
        
        self.view.addSubview(getExchangeRates)
        getExchangeRates.snp.makeConstraints { (make) in
            
            make.top.equalTo(targetCurrencies.snp.bottom).offset(80)
            make.height.equalTo(20)
            make.width.equalTo(180)
            make.centerX.equalToSuperview()
            
        }
        
        tableView.register(ExchangeRatesTableViewCell.self, forCellReuseIdentifier: "dataCell")
        tableView.dataSource = self
        tableView.delegate = self
        
        self.view.addSubview(tableView)
        tableView.backgroundColor = .blue
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(getExchangeRates.snp.bottom).offset(30)
            make.left.equalTo(0)
            make.bottom.equalTo(0)
            make.right.equalTo(0)
        }
        
        
        getExchangeRates.addTarget(self, action: #selector(getRates), for: .touchUpInside)
        
        
    }
    
    @objc func getRates() {
        
        if let from = baseCurrency.text,let to = targetCurrencies.text {
            
            print("form value",from)
            print("to value",to)
            
            let exchangeRateVM = ExchangeRatesViewModel()
            
            exchangeRateVM.getExchangeRate(base: from, symbols: to) { (response) in
                
                DispatchQueue.main.async {
                    print(response.rates.count)
                    self.values = Array(response.rates.values) as? [Double]
                    self.keys = Array(response.rates.keys)
                    self.tableView.reloadData()
                    
                }
            }
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let vale = values {
            return vale.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell", for: indexPath as IndexPath) as? ExchangeRatesTableViewCell
        
        
        cell?.configureCellWith(country: keys?[indexPath.row], currency: values?[indexPath.row])
        return cell!
    }
}



