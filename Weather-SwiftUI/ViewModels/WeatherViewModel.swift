//
//  WeatherViewModel.swift
//  Weather-SwiftUI
//
//  Created by Paul Carroll on 10/10/20.
//  Copyright © 2020 Paul Carroll. All rights reserved.
//

import Foundation
import Combine

class WeatherViewModel: ObservableObject {
    private let weatherService = WeatherService()
    
    @Published var allWeatherData: AllWeatherData?
    var cancellationToken: AnyCancellable?
    
    init() {
        getWeather()
    }
}

extension WeatherViewModel {
    func getWeather() {
        cancellationToken = weatherService.getWeather()
            .mapError({ (error) -> Error in
                print(error)
                return error
            })
            .sink(receiveCompletion: { _ in },
                  receiveValue: {
                    self.allWeatherData = $0
                  }
            )
    }
}
