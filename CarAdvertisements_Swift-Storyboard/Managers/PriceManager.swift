//
//  Manager.swift
//  CarAdvertisements_Swift-Storyboard
//
//  Created by Alexander on 11.12.23.
//

import Foundation

final class PriceManager {
    
    // MARK: - Private properties
    private let dollarExchangeRate = 3.19
    
    // MARK: - Helpers
    func usdPrice(price: Double) -> Int {
        return Int(price/dollarExchangeRate)
    }
    
    func costOfLeasing(price: Double) -> Int {
        return Int((price * 1.14)/60)
    }
}
