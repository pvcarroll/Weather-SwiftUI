//
//  Weather.swift
//  Weather-SwiftUI
//
//  Created by Paul Carroll on 10/10/20.
//  Copyright © 2020 Paul Carroll. All rights reserved.
//

import Foundation

struct CurrentWeather: Codable {
    let dt: Int
    let sunrise: Int
    let sunset: Int
    let temp: Float
    let feels_like: Float
    let pressure: Int
    let humidity: Int
    let dew_point: Float
    let uvi: Float
    let clouds: Int
    let visibility: Int
    let wind_speed: Float
    let wind_deg: Int
    let weather: [Weather]
}

struct HourlyWeather: Codable {
    let dt: Int
    let temp: Float
    let feels_like: Float
    let pressure: Int
    let humidity: Int
    let dew_point: Float
    let clouds: Int
    let visibility: Int
    let wind_speed: Float
    let wind_deg: Int
    let weather: [Weather]
    let pop: Int
}

struct DailyWeather: Codable {
    let dt: Int
    let temp: Temp
    let weather: [Weather]
}

struct Temp: Codable {
    let min: Float
    let max: Float
}

struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}
