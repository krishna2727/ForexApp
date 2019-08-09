//
//  ForexMainModel.swift
//  ForexApp
//
//  Created by fordlabs on 31/07/19.
//  Copyright © 2019 fordlabs. All rights reserved.
//

struct ForexMainModel : Codable {
    
    let success : Bool?
    let date : String?
    let result : Double?
    let query : ForexQueryDataModel?
    let info : ForexInfoDataModel?
}
