//
//  Currency.swift
//  ExchangeRateProsvetova
//
//  Created by Prosvetova Lina on 29.03.2022.
//

import Foundation
import UIKit

struct Currency: Decodable, Hashable {
    var name: String
    var from: Int
    var currMnemTo: String
    var currMnemFrom: String
    var basic: String
    var to: Int
    var buy: String
    var sale: String
    var deltaBuy: String
    var deltaSale: String
}

