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
                HourlyWeatherView(viewModel: viewModel)
                
                Divider()
                    .padding(.leading, 0)
                    .background(Color.white)
                DailyWeatherView(viewModel: viewModel)
                Divider()
                    .padding(.leading, 0)
                    .background(Color.white)
                if let description = viewModel.allWeatherData?.current.weather.first?.description {
                    Text("Today: \(description)")
                    Divider()
                        .padding(.leading, 0)
                        .background(Color.white)
                }
                HStack {
                    VStack {
                        Text("SUNRISE")
                        if let sunrise = viewModel.allWeatherData?.current.sunrise {
                            Text(Date(timeIntervalSince1970: TimeInterval(sunrise)).time)
                        }
                    }
                    Spacer()
                    VStack {
                        Text("SUNSET")
                        if let sunset = viewModel.allWeatherData?.current.sunset {
                            Text(Date(timeIntervalSince1970: TimeInterval(sunset)).time)
                        }
                    }
                }
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
            Image(backgroundImageForCurrentCondition())
                .resizable()
                .edgesIgnoringSafeArea(.top)
        )
    }
    
    private func backgroundImageForCurrentCondition() -> String {
        guard let condition = viewModel.allWeatherData?.current.weather.first?.main else { return "sunny" }
        switch condition {
        case "Clear":
            guard let dt = viewModel.allWeatherData?.current.dt else { return "sunny" }
            let isDaytime = viewModel.isDaytime(time: dt)
            let imageName = (isDaytime ? "sunny" : "night")
            return imageName
        case "Clouds": return "cloudy"
        case "Thunderstorm": return "storm"
        case "Drizzle": return "rain"
        case "Rain": return "rain"
        case "Snow": return "snow"
        default:
            print("condition: ", condition)
            return "sunny"
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView(viewModel: WeatherViewModel())
    }
}
