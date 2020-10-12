//
//  HourlyWeatherView.swift
//  Weather-SwiftUI
//
//  Created by Paul Carroll on 10/7/20.
//  Copyright © 2020 Paul Carroll. All rights reserved.
//

import SwiftUI

struct HourlyWeatherView: View {
    @ObservedObject var viewModel: WeatherViewModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false, content: {
            if let hourlyForecasts = viewModel.allWeatherData?.hourly {
                HStack {
                    ForEach(hourlyForecasts, id: \.dt) { hourlyForecast in
                        if let dt = hourlyForecast.dt
                           , let condition = hourlyForecast.weather.first?.main
                           , let temp = hourlyForecast.temp {
                            VStack(spacing: 10) {
                                Text("\(Date(timeIntervalSince1970: TimeInterval(dt)).hour)")
                                imageForCondition(condition, isDaytime: isDaytime(time: dt))
                                    .resizable()
                                    .frame(width: 20, height: 20, alignment: .center)
                                Text("\(Int(temp))°")
                            }
                        }
                    }
                }
            }
        })
    }
    
    private func imageForCondition(_ condition: String, isDaytime: Bool) -> Image {
        switch condition {
        case "Clear":
            let imageName = (isDaytime ? "sun.max.fill" : "moon.stars.fill")
            return Image(systemName: imageName)
        case "Clouds": return Image(systemName: "cloud.fill")
        case "Thunderstorm": return Image(systemName: "cloud.bolt.rain.fill")
        case "Drizzle": return Image(systemName: "cloud.drizzle.fill")
        case "Rain": return Image(systemName: "cloud.rain.fill")
        case "Snow": return Image(systemName: "cloud.snow.fill")
        default:
            print("condition: ", condition)
            return Image(systemName: "questionmark.circle")
        }
    }
    
    private func isDaytime(time: Int) -> Bool {
        guard let sunrise = viewModel.allWeatherData?.current.sunrise else { return false }
        guard let sunset = viewModel.allWeatherData?.current.sunset else { return false }
        return (time > sunrise) && (time < sunset)
    }
}

struct HourlyWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        HourlyWeatherView(viewModel: WeatherViewModel())
    }
}
