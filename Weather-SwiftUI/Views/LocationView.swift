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
                Text("<Austin>")
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
                            ForEach(hourlyForecasts, id: \.dt) { hourlyWeather in
                                if let dt = hourlyWeather.dt
                                   , let condition = hourlyWeather.weather.first?.main
                                   , let temp = hourlyWeather.temp {
                                    
                                    HourlyWeatherView(
                                        time: "\(Date(timeIntervalSince1970: TimeInterval(dt)).hour)",
                                        condition: condition,
                                        temp: "\(Int(temp))°"
                                    )
                                }
                            }
                        }
                    }
                })
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
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView(viewModel: WeatherViewModel())
    }
}
