//
//  Car.swift
//  CarAdvertisements_Swift-Storyboard
//
//  Created by Alexander on 11.12.23.
//

import Foundation

struct Car {
    
    // MARK: - Public properties
    let id: Int
    var name: String
    var price: Double
    
    var yearRelease: Int
    var typeBox: CarBoxes
    var volumeEngine: Double
    var engineType: CarEngines
    var bodyType: CarBodyTypes
    var mileage: Int
    
    var description: String
    var equipment: String
    var location: String
    var date: String
    var imageNames: [String]

    var isExchange = false
    var isFavourites = false
    var isHidden = false
    var isTop = false
    var isVIN = false
    
    let dollarExchangeRate = 3.19
    
}

enum CarBoxes {
    case automatic
    case manual
}

enum CarEngines {
    case petrol
    case diesel
    case electric
}

enum CarBodyTypes {
    case sedan
    case hatchback
    case stationWagon
    case liftback
    case coupe
    case convertible
    case roadster
    case stretch
    case targa
    case suv
    case crossover
    case pickupTruck
    case van
    case Minivan
}
