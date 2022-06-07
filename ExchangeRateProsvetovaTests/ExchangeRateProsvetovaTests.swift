//
//  ExchangeRateProsvetovaTests.swift
//  ExchangeRateProsvetovaTests
//
//  Created by Prosvetova Lina on 07.06.2022.
//

import XCTest
@testable import ExchangeRateProsvetova

class ExchangeRateProsvetovaTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let inputDate = "07.06.2022 09:26:26"
        let resultDate = inputDate.convertToDisplayFormat()
        XCTAssertEqual(resultDate, "7 июня 09:26:26")
        
    }
    
    func testCurrencyNameFormatter() throws {
        let inputDoubleCurrency = "Доллар США / Швейцарский франк"
        let resultCurrencyName = inputDoubleCurrency.currencyNameFormatter()
        XCTAssertEqual(resultCurrencyName, "Доллар США / \nШвейцарский франк")
    }
    
    func testformattedPrice() throws {
        let inputPrice = "63.0000"
        let inputCurrencyCode = "EUR"
        let formattedPrice = inputPrice.formattedPrice(currencyCode: inputCurrencyCode)
        XCTAssertEqual(formattedPrice, "€ 63.00")
    }
    

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
       
        measure {
         
        }
    }

}
