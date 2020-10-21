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
                                imageForCondition(condition, isDaytime: viewModel.isDaytime(time: dt))
                                    .frame(width: 20, height: 20, alignment: .center)
                                Text("\(Int(temp))°")
                            }
                        }
                    }
                }
            }
        })
    }
    
    private func imageForCondition(_ condition: String, isDaytime: Bool) -> some View {
        let image: Image
        var isYellow = false
        
        switch condition {
        case "Clear":
            if isDaytime {
                image = Image(systemName: "sun.max.fill")
                isYellow = true
            } else {
                image = Image(systemName: "moon.stars.fill")
            }
        case "Clouds": image = Image(systemName: "cloud.fill")
        case "Thunderstorm": image = Image(systemName: "cloud.bolt.rain.fill")
        case "Drizzle": image = Image(systemName: "cloud.drizzle.fill")
        case "Rain": image = Image(systemName: "cloud.rain.fill")
        case "Snow": image = Image(systemName: "cloud.snow.fill")
        default:
            print("condition: ", condition)
            image = Image(systemName: "questionmark.circle")
        }
        let color = isYellow ? Color.yellow : Color.white
        return image.resizable().foregroundColor(color)
    }
}

struct HourlyWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        HourlyWeatherView(viewModel: WeatherViewModel())
    }
}
