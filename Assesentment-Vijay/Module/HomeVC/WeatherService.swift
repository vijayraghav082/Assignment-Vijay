//
//  WeatherService.swift
//  Assesentment-Vijay
//
//  Created by Vijay Singh Raghav on 20/09/24.
//

import Foundation

protocol WeatherService {
    func getWeatherData(city: String, days: String?) async throws -> Result<WeatherModel, Error>
}

class WeatherServiceImplementation: WeatherService {
    
    private let networkManager: NetworkRequest = URLSessionNetworkManager()
    
    func getWeatherData(city: String, days: String?) async throws -> Result<WeatherModel, any Error> {
        do {
            let data: WeatherModel = try await networkManager.performRequest(endpoint: EndPoint.getWeatherData(city, days))
            return .success(data)
        } catch let error {
            return .failure(error)
        }
    }
    
}
