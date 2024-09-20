//
//  WeatherVC.swift
//  Assesentment-Vijay
//
//  Created by Vijay Singh Raghav on 20/09/24.
//

import UIKit

class WeatherVC: UIViewController {

    var viewModel: WeatherVM!
    
    @IBOutlet weak var minTempLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var conditionLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    final func initialSetup() {
        viewModel = WeatherVM()        
        viewModel.delegate = self
        viewModel.getWeatheData(city: "bhopal", days: "1")
    }
}

extension WeatherVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.weatherData?.forecast.forecastday.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = String(describing: WeatherCell.self)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? WeatherCell else {
            return UITableViewCell()
        }
        cell.setData(data: viewModel.weatherData?.forecast.forecastday[indexPath.row])
        return cell
    }
}


extension WeatherVC: WeatherDataFetched {
    func failedToFetchData() {
        //Error Handling
    }
    
    func didFetchedWeatherData() {
        let current = viewModel.weatherData?.current
        minTempLabel.text = "\(current?.tempC ?? 0) C"
        humidityLabel.text = "\(current?.humidity ?? 0)"
        windSpeedLabel.text = "\(current?.windKph ?? 0) km/h"
        conditionLabel.text = current?.condition.text
        descriptionLabel.text = current?.condition.text
        tableView.reloadData()
    }
}

extension WeatherVC: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let city = searchBar.text else { return }
        viewModel.getWeatheData(city: city, days: "5")
        searchBar.resignFirstResponder()
    }
}

