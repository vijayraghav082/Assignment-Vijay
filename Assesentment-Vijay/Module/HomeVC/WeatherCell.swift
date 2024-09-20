//
//  WeatherCell.swift
//  Assesentment-Vijay
//
//  Created by Vijay Singh Raghav on 20/09/24.
//

import UIKit

final class WeatherCell: UITableViewCell {
    
    @IBOutlet weak var maxLabel: UILabel!
    @IBOutlet weak var minLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var conditionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    final func setData(data: Forecastday?) {
        dateLabel.text = data?.date
        maxLabel.text = "\(data?.day.maxtempC ?? 0) "
        minLabel.text = "\(data?.day.mintempC ?? 0)"
        conditionLabel.text = data?.day.condition.text
    }
    
}
