//
//  SecondViewController.swift
//  ForexApp
//
//  Created by fordlabs on 31/07/19.
//  Copyright © 2019 fordlabs. All rights reserved.
//

import UIKit
import Foundation
import SnapKit
class SecondViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    
    
     var currencyCountryCodes = ["AED","AFN","ALL","AMD","ANG","AOA","ARS","AUD","AWG","AZN","BAM","BBD","BDT","BGN","BHD"]
    var myPickerVIew = UIPickerView()
    var pickerView2 = UIPickerView()
    
    
    let label: UILabel = {
        let lbl = UILabel()
        lbl.text = "Currency Coverter"
        return lbl
    }()
    
    let from: UITextField = {
        let tx = UITextField()
        tx.placeholder = "from which currency"
        tx.backgroundColor = .white
        return tx
    }()
    
    let to: UITextField = {
        let tx = UITextField()
        tx.placeholder = "to which currency"
        tx.backgroundColor = .white
        return tx
    }()
    
    let amount: UITextField = {
        let am = UITextField()
        am.placeholder = "Enter Amount"
        am.backgroundColor = .white
        return am
    }()
    
    let convert :UIButton = {
        let CurrencyConverter = UIButton()
        CurrencyConverter.setTitle("Convert", for: .normal)
        CurrencyConverter.backgroundColor = .black
        return CurrencyConverter
    }()
    
    let resultLabel: UILabel = {
        let lbl = UILabel()
        return lbl
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        currencyConverterbackGroundImage()
        navigationController?.isNavigationBarHidden = false
        
    
//        myPickerVIew.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 280.0)
//        myPickerVIew.dataSource = self
        myPickerVIew.delegate = self
        pickerView2.delegate = self
        from.inputView = myPickerVIew
        to.inputView = pickerView2
        createToolbar()
        
        
    }
    
    func currencyConverterbackGroundImage() {
        
        let backGroundImage = UIImageView(frame: UIScreen.main.bounds)
        backGroundImage.image = UIImage(named: "CurrencyConverterLogo")
        backGroundImage.contentMode = (UIView.ContentMode.scaleToFill)
        self.view.insertSubview(backGroundImage, at: 0)
    }
    
    func setup() {
        
        self.view.addSubview(label)
        label.snp.makeConstraints { (make) in
            
            make.top.equalToSuperview().offset(120)
            make.centerX.equalToSuperview()
            
        }
        
        
        self.view.addSubview(from)
        from.snp.makeConstraints { (make) in
            
            make.top.equalTo(label.snp.bottom).offset(60)
            make.height.equalTo(20)
            make.width.equalTo(160)
            make.centerX.equalToSuperview()
            
        }
        
        self.view.addSubview(to)
        to.snp.makeConstraints { (make) in
            
            make.top.equalTo(from.snp.bottom).offset(20)
            make.height.equalTo(20)
            make.width.equalTo(160)
            make.centerX.equalToSuperview()
            
        }
        
        self.view.addSubview(amount)
        amount.snp.makeConstraints { (make) in
            
            make.top.equalTo(to.snp.bottom).offset(20)
            make.height.equalTo(20)
            make.width.equalTo(160)
            make.centerX.equalToSuperview()
            
        }
        
        self.view.addSubview(convert)
        convert.snp.makeConstraints { (make) in
            
            make.top.equalTo(amount.snp.bottom).offset(40)
            make.height.equalTo(20)
            make.width.equalTo(140)
            make.centerX.equalToSuperview()
            
        }
        
        self.view.addSubview(resultLabel)
        resultLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(convert.snp.bottom).offset(60)
            make.height.equalTo(20)
            make.width.equalTo(140)
            make.centerX.equalToSuperview()
            
        }
        
        convert.addTarget(self, action: #selector(convertCurrency), for: .touchUpInside)
        
        
        
    }
    @objc func convertCurrency() {
        
        if let from = from.text,let to = to.text, let ea = amount.text {
            
            let currencyVM = CurrencyConverterViewModel()
         
            currencyVM.convertCurrency(fromCountry: from, toCountry: to, enterAmount: ea) { (response) in
                
                DispatchQueue.main.async {
                    self.resultLabel.text = String(response.result ?? 0)
                }
            
            }
        
        
        }
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencyCountryCodes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return currencyCountryCodes[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView == from.inputView {
            from.text = currencyCountryCodes[row]
        }
        else {
            to.text = currencyCountryCodes[row]
        }
       
        
        

    }
    
    func createToolbar() {
        
        let toolBar  = UIToolbar()
        toolBar.barStyle = .default
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneClick))
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelClick))
        toolBar.setItems([doneButton,cancelButton], animated: false)
        from.inputAccessoryView = toolBar
        to.inputAccessoryView = toolBar
    }
    
    @objc func doneClick() {
        
        self.view.endEditing(true)
    }
    
    @objc func cancelClick() {
        
         self.view.endEditing(true)
    }


}
