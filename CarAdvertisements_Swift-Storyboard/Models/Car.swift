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
    
}

enum CarBoxes {
    case automatic
    case manual
    
    var stringValue: String {
        switch self {
        case .automatic:
            return "автомат"
        case .manual:
            return "ручная"
        }
    }
}

enum CarEngines {
    case petrol
    case diesel
    case electric
    
    var stringValue: String {
        switch self {
        case .petrol:
            return "бензин"
        case .diesel:
            return "дизель"
        case .electric:
            return "электрический"
        }
    }
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
    case minivan
    
    var stringValue: String {
        switch self {
        case .sedan:
            return "седан"
        case .hatchback:
            return "хэтчбек"
        case .stationWagon:
            return "пассажирский вагон"
        case .liftback:
            return "лифтбек"
        case .coupe:
            return "купе"
        case .convertible:
            return "кабриолет"
        case .roadster:
            return "родстер"
        case .stretch:
            return "стреч"
        case .targa:
            return "тарга"
        case .suv:
            return "внедорожник"
        case .crossover:
            return "кроссовер"
        case .pickupTruck:
            return "пикап"
        case .van:
            return "фургон"
        case .minivan:
            return "микроавтобус"
        }
    }
}
