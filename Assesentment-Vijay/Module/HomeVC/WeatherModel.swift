//
//  WeatherModel.swift
//  Assesentment-Vijay
//
//  Created by Vijay Singh Raghav on 20/09/24.
//

import Foundation

struct WeatherModel: Codable {
    let current: Current
    let forecast: Forecast
}

struct Forecast: Codable {
    let forecastday: [Forecastday]
}

struct Forecastday: Codable {
    let day: Day
    let date: String?    
}


struct Day: Codable {
    let condition: Condition
    let maxtempC, mintempC: Double?
    
    enum CodingKeys: String, CodingKey {
        case maxtempC = "maxtemp_c"
        case mintempC = "mintemp_c"
        case condition
    }
}

struct Current: Codable {
    let tempC: Double?
    let condition: Condition
    let windKph: Double?
    let humidity: Int?

    enum CodingKeys: String, CodingKey {
        case tempC = "temp_c"
        case condition
        case windKph = "wind_kph"
        case humidity
    }
}

struct Condition: Codable {
    let text: String?
}
