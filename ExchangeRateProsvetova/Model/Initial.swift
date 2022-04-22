//
//  Initial.swift
//  ExchangeRateProsvetova
//
//  Created by Prosvetova Lina on 31.03.2022.
//

import Foundation

struct Initial: Decodable {
    let rid : String
    var downloadDate: String
    var rates: [Currency]
}
