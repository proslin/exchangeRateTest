//
//  ERError.swift
//  ExchangeRateProsvetova
//
//  Created by Prosvetova Lina on 01.04.2022.
//

import Foundation

enum ERError: String, Error {
    case unableToComplete = "Невозможно сделать запрос. Проверьте подключение к сети."
    case invalidResponse = "Некорректный ответ от сервера. Повторите попытку позже."
    case invalidData = "Полученные данные не корректны. Повторите попытку позже."
    case rateIsEmpty = "Список валют пуст. Повторите попытку позже."
}
