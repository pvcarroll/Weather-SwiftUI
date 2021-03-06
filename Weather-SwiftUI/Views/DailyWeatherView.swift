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
                if let dailyForecasts = viewModel.allWeatherData?.daily.dropFirst() {
                    ForEach(dailyForecasts, id: \.dt) { dailyForecast in
                        if let dt = dailyForecast.dt
                           , let main = dailyForecast.weather.first?.main
                           , let condition = Condition(rawValue: main)
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
    private func imageForCondition(_ condition: Condition) -> Image {
        switch condition {
        case .clear: return Image(systemName: "sun.max.fill")
        case .clouds: return Image(systemName: "cloud.fill")            
        case .thunderstorm: return Image(systemName: "cloud.bolt.rain.fill")
        case .drizzle: return Image(systemName: "cloud.drizzle.fill")
        case .rain: return Image(systemName: "cloud.rain.fill")
        case .snow: return Image(systemName: "cloud.snow.fill")
        case .other:
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
