//
//  LocationView.swift
//  Weather-SwiftUI
//
//  Created by Paul Carroll on 8/9/20.
//  Copyright © 2020 Paul Carroll. All rights reserved.
//

import SwiftUI

struct LocationView: View {
    @ObservedObject var viewModel: WeatherViewModel
    
    var body: some View {
        VStack {
            VStack {
                Text("Austin")
                    .font(.title)
                    .fontWeight(.medium)
                Text("\(viewModel.allWeatherData?.current.weather.first?.main ?? "condition")")
                    .font(.body)
                Text("\(Int(viewModel.allWeatherData?.current.temp ?? -1))°")
                    .font(.system(size: 50))
            }
            .foregroundColor(.white)
            
            ScrollView(.vertical, showsIndicators: false, content: {
                HStack {
                    Text(Date().dayOfWeek() ?? "unknown")
                    Text("TODAY")
                    Spacer()
                    Text("\(Int(viewModel.allWeatherData?.daily[0].temp.max ?? -1))")
                        .padding(.trailing)
                    Text("\(Int(viewModel.allWeatherData?.daily[0].temp.min ?? -1))")
                        .opacity(0.8)
                }
                Divider()
                    .padding(.leading, 0)
                    .background(Color.white)
                
                ScrollView(.horizontal, showsIndicators: false, content: {
                    if let hourlyForecasts = viewModel.allWeatherData?.hourly {
                        HStack {
                            ForEach(hourlyForecasts, id: \.dt) { hourlyForecast in
                                if let dt = hourlyForecast.dt
                                   , let condition = hourlyForecast.weather.first?.main
                                   , let temp = hourlyForecast.temp {
                                    HourlyWeatherView(
                                        time: "\(Date(timeIntervalSince1970: TimeInterval(dt)).hour)",
                                        condition: condition,
                                        temp: "\(Int(temp))°",
                                        isDaytime: isDaytime(time: dt)
                                    )
                                }
                            }
                        }
                    }
                })
                Divider()
                    .padding(.leading, 0)
                    .background(Color.white)
                DailyWeatherView(viewModel: viewModel)
                
                Divider()
                    .padding(.leading, 0)
                    .background(Color.white)
            })
            .padding([.leading, .trailing])
            .foregroundColor(.white)
        }
        .padding(.top, 40)
        .frame(width: UIScreen.main.bounds.width, height: nil, alignment: .center)
        .background(
            Image("partlyCloudy")
                .resizable()
                .edgesIgnoringSafeArea(.top)
        )
    }
    
    private func isDaytime(time: Int) -> Bool {
        guard let sunrise = viewModel.allWeatherData?.current.sunrise else { return false }
        guard let sunset = viewModel.allWeatherData?.current.sunset else { return false }
        return (time > sunrise) && (time < sunset)
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView(viewModel: WeatherViewModel())
    }
}
