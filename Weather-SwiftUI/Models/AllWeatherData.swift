//
//  AllWeatherData.swift
//  Weather-SwiftUI
//
//  Created by Paul Carroll on 10/10/20.
//  Copyright © 2020 Paul Carroll. All rights reserved.
//

import Foundation

struct AllWeatherData: Codable {
    let lat: Float
    let lon: Float
    let timezone: String
    let timezone_offset: Int
    let current: CurrentWeather
    let hourly: [HourlyWeather]
    let daily: [DailyWeather]
}
