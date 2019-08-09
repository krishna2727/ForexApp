//
//  ForexRatesDataModel.swift
//  ForexApp
//
//  Created by fordlabs on 31/07/19.
//  Copyright © 2019 fordlabs. All rights reserved.
//

struct ForexRatesDataModel: Codable {
    
    let success : Bool?
    let date : String?
    let timestamp : Double?
    let base : String?
    let rates :[String: Double?]

}
