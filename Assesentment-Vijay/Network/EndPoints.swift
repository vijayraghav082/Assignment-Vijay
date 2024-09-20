//
//  AppDelegate.swift
//  Assesentment-Vijay
//
//  Created by Vijay Singh Raghav on 20/09/24.
//

import Foundation

protocol EndpointProvider {
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var body: [String: Any] { get }
    var header: [String: String] { get }
}

extension EndpointProvider {
    
    var baseURL: String {
        return "http://api.weatherapi.com/v1/forecast.json?key=d278ef0c7cad492c9d475350242009&q="
    }
}

enum HTTPMethod: String {
    case delete = "DELETE"
    case get = "GET"
    case patch = "PATCH"
    case post = "POST"
    case put = "PUT"
}


enum EndPoint: EndpointProvider {

    case getWeatherData(String, String?)
    
    var method: HTTPMethod {
        switch self {
        case .getWeatherData:
            return .get
        }
    }
    
    var header: [String : String] {
        return [:]
    }
    
    var path: String {
        switch self {
        case .getWeatherData(let city, let days):
            if let days {
                return "\(city)&days=\(days)"
            }
            return "\(city)"
        }
    }
    
    var body: [String: Any] {
        return [:]
    }
}
