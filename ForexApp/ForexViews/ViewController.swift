//
//  ViewController.swift
//  ForexApp
//
//  Created by fordlabs on 31/07/19.
//  Copyright © 2019 fordlabs. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let label: UILabel = {
        let lbl = UILabel()
        lbl.text = "Forex"
        return lbl
    }()
    
    let currencyConverter:UIButton = {
        let CurrencyConverter = UIButton()
        CurrencyConverter.setTitle("Currency Converter", for: .normal)
        CurrencyConverter.backgroundColor = .black
        return CurrencyConverter
    }()

    let ExchangeRateCalculator:UIButton = {
        let ExchangeRateCalculator = UIButton()
        ExchangeRateCalculator.setTitle("ExchangeRate Calculator", for: .normal)
        ExchangeRateCalculator.backgroundColor = .black
        return ExchangeRateCalculator
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        backGroundImage()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
         self.navigationController?.isNavigationBarHidden = true
    }
        
        
        
////        ForexApiClient().convertCurrency(fromCountry: "USD", toCountry: "ILS", enterAmount: "12") { (response) in
////
////            print(response)
////        }
////
////        ForexApiClient().getExchangeRate(base: "INR", symbols: "JPY,EUR") { (ratesresponse) in
////            print(ratesresponse)
//        }
//    }

    
    
    func backGroundImage() {
        
        let backGroundImage = UIImageView(frame: UIScreen.main.bounds)
        backGroundImage.image = UIImage(named: "ForexLogo")
        backGroundImage.contentMode = (UIView.ContentMode.scaleToFill)
        self.view.insertSubview(backGroundImage, at: 0)
    }
    
    func setup() {
        
        self.view.addSubview(label)
        label.snp.makeConstraints { (make) in
        
            make.top.equalToSuperview().offset(120)
            make.centerX.equalToSuperview()
            
        }
        
        self.view.addSubview(currencyConverter)
        currencyConverter.snp.makeConstraints { (make) in
            make.top.equalTo(label.snp.bottom).offset(200)
            make.centerX.equalToSuperview()
        }
        
        self.view.addSubview(ExchangeRateCalculator)
        ExchangeRateCalculator.snp.makeConstraints { (make) in
            make.top.equalTo(currencyConverter.snp.bottom).offset(200)
            make.centerX.equalToSuperview()
        }
        
        currencyConverter.addTarget(self, action: #selector(currecyConverterButtonTapped), for: .touchUpInside)
        
         ExchangeRateCalculator.addTarget(self, action: #selector(ExchangeRateCaliculatorTapped), for: .touchUpInside)
        
        
    }
    
    @objc func currecyConverterButtonTapped(){
        
                let secondVc = SecondViewController()
                self.navigationController?.pushViewController(secondVc, animated: true)
            }
    
    @objc func ExchangeRateCaliculatorTapped(){
        
        let thirdVC = ThirdViewController()
        self.navigationController?.pushViewController(thirdVC, animated: true)
    }



}
