//
//  WeatherService.swift
//  Weather-SwiftUI
//
//  Created by Paul Carroll on 10/7/20.
//  Copyright © 2020 Paul Carroll. All rights reserved.
//

import Foundation
import Combine
import Keys

class WeatherService {
    static let apiClient = APIClient()
    private let openWeatherMapURL = "https://api.openweathermap.org/data/2.5/onecall"
    private let openWeatherAPIKey = WeatherSwiftUIKeys().openWeatherAPIKey
    
    let austinLat = "30.2672"
    let austinLon = "97.7431"
    
    func getWeather() -> AnyPublisher<AllWeatherData, Error> {
        let urlString = "\(openWeatherMapURL)?lat=\(austinLat)&lon=\(austinLon)&appid=\(openWeatherAPIKey)"
        guard let url = URL(string: urlString) else { fatalError("Couldn't create URL") }
        
        let request = URLRequest(url: url)
        
        return WeatherService.apiClient.run(request)
            .map(\.value)
            .eraseToAnyPublisher()
    }
}
