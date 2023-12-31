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

struct carManager {
    
    func getCars() -> [Car] {
        let ads = [
            Car(id: 53453453451, name: "Nissan GT-R R35 Рестайлинг", price: 159288, yearRelease: 2010, typeBox: .automatic, volumeEngine: 3.8, engineType: .petrol, bodyType: .coupe, mileage: 158000, description: "Black серия\nABS, подогрев ручек, бортовой компьютер\nРодной пробег, растаможке под 100 %\nПроходит в РФ\nСрочно!!", equipment: "ABS\nКофры\nПодогрев ручек", location: "Минск", date: "11 окт", imageNames: ["Car1", "Car1", "Car1", "Car1"], isTop: true, isVIN: true),
            Car(id: 53453453452, name: "Nissan GT-R R35", price: 213246, yearRelease: 2012, typeBox: .automatic, volumeEngine: 3.2, engineType: .petrol, bodyType: .coupe, mileage: 190000, description: "Black серия\nABS, подогрев ручек, бортовой компьютер\nРодной пробег, растаможке под 100 %\nПроходит в РФ\nСрочно!!", equipment: "ABS\nКофры\nПодогрев ручек", location: "Минск", date: "11 окт", imageNames: ["Car2", "Car2", "Car2", "Car2"], isTop: true),
            Car(id: 53453453453, name: "Nissan GT R46", price: 112960, yearRelease: 2019, typeBox: .automatic, volumeEngine: 2.8, engineType: .petrol, bodyType: .coupe, mileage: 70000, description: "Black серия\nABS, подогрев ручек, бортовой компьютер\nРодной пробег, растаможке под 100 %\nПроходит в РФ\nСрочно!!", equipment: "ABS\nКофры\nПодогрев ручек", location: "Брест", date: "12 окт", imageNames: ["Car3", "Car3", "Car3", "Car3"], isVIN: true),
            Car(id: 53453453454, name: "Nissan R70 Рестайлинг", price: 79800, yearRelease: 2008, typeBox: .automatic, volumeEngine: 1.8, engineType: .diesel, bodyType: .coupe, mileage: 254000, description: "Black серия\nABS, подогрев ручек, бортовой компьютер\nРодной пробег, растаможке под 100 %\nПроходит в РФ\nСрочно!!", equipment: "ABS\nКофры\nПодогрев ручек", location: "Брест", date: "12 окт", imageNames: ["Car4", "Car4", "Car4", "Car4"]),
            Car(id: 53453453455, name: "Nissan GT-R R35", price: 138900, yearRelease: 2011, typeBox: .automatic, volumeEngine: 2.8, engineType: .diesel, bodyType: .coupe, mileage: 260000, description: "Black серия\nABS, подогрев ручек, бортовой компьютер\nРодной пробег, растаможке под 100 %\nПроходит в РФ\nСрочно!!", equipment: "ABS\nКофры\nПодогрев ручек", location: "Минск", date: "10 окт", imageNames: ["Car5", "Car5", "Car5", "Car5"]),
            Car(id: 53453453456, name: "BMW X6 Рестайлинг", price: 190288, yearRelease: 2019, typeBox: .automatic, volumeEngine: 3.8, engineType: .petrol, bodyType: .coupe, mileage: 58000, description: "Black серия\nABS, подогрев ручек, бортовой компьютер\nРодной пробег, растаможке под 100 %\nПроходит в РФ\nСрочно!!", equipment: "ABS\nКофры\nПодогрев ручек", location: "Минск", date: "11 окт", imageNames: ["Car6", "Car6", "Car6", "Car6"], isTop: true, isVIN: true),
            Car(id: 53453453457, name: "BMW X6", price: 223246, yearRelease: 2022, typeBox: .automatic, volumeEngine: 3.2, engineType: .petrol, bodyType: .coupe, mileage: 10000, description: "Black серия\nABS, подогрев ручек, бортовой компьютер\nРодной пробег, растаможке под 100 %\nПроходит в РФ\nСрочно!!", equipment: "ABS\nКофры\nПодогрев ручек", location: "Минск", date: "11 окт", imageNames: ["Car7", "Car7", "Car7", "Car7"], isTop: true),
            Car(id: 53453453458, name: "BMW X6 Рестайлинг", price: 212960, yearRelease: 2017, typeBox: .automatic, volumeEngine: 4.8, engineType: .petrol, bodyType: .coupe, mileage: 50000, description: "Black серия\nABS, подогрев ручек, бортовой компьютер\nРодной пробег, растаможке под 100 %\nПроходит в РФ\nСрочно!!", equipment: "ABS\nКофры\nПодогрев ручек", location: "Брест", date: "11 окт", imageNames: ["Car8", "Car8", "Car8", "Car8"], isVIN: true),
            Car(id: 53453453459, name: "BMW X6", price: 179800, yearRelease: 2020, typeBox: .automatic, volumeEngine: 1.8, engineType: .diesel, bodyType: .coupe, mileage: 4000, description: "Black серия\nABS, подогрев ручек, бортовой компьютер\nРодной пробег, растаможке под 100 %\nПроходит в РФ\nСрочно!!", equipment: "ABS\nКофры\nПодогрев ручек", location: "Брест", date: "12 окт", imageNames: ["Car9", "Car9", "Car9", "Car9"]),
            Car(id: 53453453460, name: "BMW X6", price: 158900, yearRelease: 2023, typeBox: .automatic, volumeEngine: 2.8, engineType: .diesel, bodyType: .coupe, mileage: 160000, description: "Black серия\nABS, подогрев ручек, бортовой компьютер\nРодной пробег, растаможке под 100 %\nПроходит в РФ\nСрочно!!", equipment: "ABS\nКофры\nПодогрев ручек", location: "Минск", date: "16 окт", imageNames: ["Car10", "Car10", "Car10", "Car10"], isFavourites: true)
        ]
        
        return ads
    }
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
