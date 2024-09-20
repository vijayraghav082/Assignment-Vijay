//
//  WeatherVM.swift
//  Assesentment-Vijay
//
//  Created by Vijay Singh Raghav on 20/09/24.
//

import Foundation

protocol WeatherDataFetched: AnyObject {
    func failedToFetchData()
    func didFetchedWeatherData()
}

final class WeatherVM {
        
    var weatherData: WeatherModel?
    let weatherService: WeatherService
    weak var delegate: WeatherDataFetched?
    
    init(weatherService: WeatherService = WeatherServiceImplementation()) {
        self.weatherService = WeatherServiceImplementation()
    }
        
    final func getWeatheData(city: String, days: String = "1") {
        Task { [weak self] in
            guard let self = self else { return }
            let result = try await weatherService.getWeatherData(city: city, days: days)
            switch result {
            case .success(let data):
                self.weatherData = data
                DispatchQueue.main.async {
                    self.delegate?.didFetchedWeatherData()
                }
            case .failure(let error):
                Console.log(error.localizedDescription)
            }
        }
    }
}

