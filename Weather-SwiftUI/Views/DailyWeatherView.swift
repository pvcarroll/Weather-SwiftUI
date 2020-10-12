//
//  DailyWeatherView.swift
//  Weather-SwiftUI
//
//  Created by Paul Carroll on 10/11/20.
//  Copyright © 2020 Paul Carroll. All rights reserved.
//

import SwiftUI

struct DailyWeatherView: View {
    @ObservedObject var viewModel: WeatherViewModel
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading) {
                if let dailyForecasts = viewModel.allWeatherData?.daily {
                    ForEach(dailyForecasts, id: \.dt) { dailyForecast in
                        if let dt = dailyForecast.dt
                           , let condition = dailyForecast.weather.first?.main
                           , let high = dailyForecast.temp.max
                           , let low = dailyForecast.temp.min {
                            HStack {
                                Text(Date(timeIntervalSince1970: TimeInterval(dt)).dayOfWeek() ?? "unknown")
                                    .font(.headline)
                                Spacer()
                                imageForCondition(condition)
                                    .padding(.trailing, 80)
                                Text("\(Int(high))")
                                Text("\(Int(low))")
                                    .opacity(0.8)
                            }
                            .padding(.bottom, 1)
                        }
                    }
                }
            }
        }
    }
    
    // TODO: consolidate
    private func imageForCondition(_ condition: String) -> Image {
        switch condition {
        case "Clear": return Image(systemName: "sun.max.fill")
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
}

struct DailyWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        DailyWeatherView(viewModel: WeatherViewModel())
    }
}
