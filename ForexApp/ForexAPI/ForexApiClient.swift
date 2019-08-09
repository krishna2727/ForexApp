//
//  ForexApiClient.swift
//  ForexApp
//
//  Created by fordlabs on 31/07/19.
//  Copyright © 2019 fordlabs. All rights reserved.
//

import Foundation

class ForexApiClient {
    
    var host = "https://fixer-fixer-currency-v1.p.rapidapi.com"
    var headers = ["x-rapidapi-host": "fixer-fixer-currency-v1.p.rapidapi.com",
                   "x-rapidapi-key": "fdd1a62164mshaa7d08ea69d24bdp117f0ejsn84495048cb87"]
    
    func convertCurrency(fromCountry : String , toCountry : String, enterAmount : String, completionhandler :  @escaping (_ dataResponse : ForexMainModel
        ) -> ()) {
        let urlWithParam = "\(host)/convert?from=\(fromCountry)&to=\(toCountry)&amount=\(enterAmount)"
        
        guard let myurl = URL(string: urlWithParam) else {
            print("some error")
            return
        }
        
        var urlrequest = URLRequest(url: myurl)
        urlrequest.allHTTPHeaderFields = headers
        urlrequest.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: urlrequest) { (data, resp, err) in
            if let error = err {
                print(error.localizedDescription)
            }
            
            guard let rawdata =  data else { return }
            
            do {
                let resp = try! JSONDecoder().decode(ForexMainModel.self, from: rawdata)
                completionhandler(resp)
            } catch (let error) {
                print(error)
            }
        }.resume()
    }
    
    
    func getExchangeRate(base : String , symbols : String, completionhandler :  @escaping (_ dataResponse : ForexRatesDataModel
        ) -> ()) {

        let urlWithParam = "\(host)/latest?base=\(base)&symbols=\(symbols)"


        guard let myurl = URL(string: urlWithParam) else {
            print("some error")
            return
        }
        var urlrequest = URLRequest(url: myurl)
        urlrequest.allHTTPHeaderFields = headers
        urlrequest.httpMethod = "GET"

        URLSession.shared.dataTask(with: urlrequest) { (data, resp, err) in
            if let error = err {
                print(error.localizedDescription)
            }

            guard let rawdata =  data else{return}

            do {

                let resp = try! JSONDecoder().decode(ForexRatesDataModel.self, from: rawdata)
                completionhandler(resp)
            }

            catch (let error) {
                print(error)

            }
            }.resume()
    }
}
