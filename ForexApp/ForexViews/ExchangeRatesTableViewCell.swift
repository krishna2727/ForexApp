//
//  ExchangeRatesTableViewCell.swift
//  ForexApp
//
//  Created by fordlabs on 07/08/19.
//  Copyright © 2019 fordlabs. All rights reserved.
//

import UIKit
import SnapKit

class ExchangeRatesTableViewCell: UITableViewCell {
    
    let countryLabel:UILabel = {
    let label = UILabel()
        label.text = "country"
        label.textColor = .green
        return label
        
    }()
    
    let currencylabel:UILabel = {
        
        let label1 = UILabel()
        label1.text = "currency"
        label1.textColor = .red
        return label1
    }()

    func configureCellWith(country: String?, currency: Double?) {
        cellSetup()
        countryLabel.text = country
        currencylabel.text = String(describing: currency)
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func cellSetup() {
        
        self.addSubview(countryLabel)
        countryLabel.snp_makeConstraints { (make) in
            make.leading.equalToSuperview().offset(30)
            make.height.equalTo(30)
        }
        
        self.addSubview(currencylabel)
        currencylabel.snp_makeConstraints { (make) in
            make.leading.equalTo(countryLabel.snp.trailing).offset(50)
            make.height.equalTo(30)
        }
    }
}
