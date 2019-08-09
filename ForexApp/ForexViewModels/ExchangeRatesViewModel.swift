//
//  ExchangeRatesViewModel.swift
//  ForexApp
//
//  Created by fordlabs on 08/08/19.
//  Copyright © 2019 fordlabs. All rights reserved.
//

import Foundation

class ExchangeRatesViewModel {
    
    let apiClient: ForexApiClient
    
    init(apiClient: ForexApiClient) {
        
        self.apiClient = apiClient
    }
    
    convenience init() {
        
        self.init(apiClient: ForexApiClient())
            
        }
    
    func getExchangeRate(base : String , symbols : String, completionhandler :  @escaping (_ dataResponse : ForexRatesDataModel) -> ()){
        
        apiClient.getExchangeRate(base: base, symbols: symbols, completionhandler: completionhandler)
    }
    
    
    
        
    }
    

