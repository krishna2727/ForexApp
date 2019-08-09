//
//  CurrencyConverterVIewModel.swift
//  ForexApp
//
//  Created by fordlabs on 08/08/19.
//  Copyright © 2019 fordlabs. All rights reserved.
//

import Foundation

class CurrencyConverterViewModel {
    
    private let apiClient: ForexApiClient
    init(apiClient:ForexApiClient){
        
        self.apiClient = apiClient
    }
    
    convenience init() {
        
        self.init(apiClient: ForexApiClient())
    }
    
    func convertCurrency(fromCountry : String , toCountry : String, enterAmount : String, completionhandler :  @escaping (_ dataResponse : ForexMainModel
        ) -> ()) {
        
        apiClient.convertCurrency(fromCountry: fromCountry, toCountry: toCountry, enterAmount: enterAmount, completionhandler: completionhandler)
        
    
}
}
