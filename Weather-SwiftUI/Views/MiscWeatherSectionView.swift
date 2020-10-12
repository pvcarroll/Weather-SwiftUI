//
//  MiscWeatherView.swift
//  Weather-SwiftUI
//
//  Created by Paul Carroll on 10/12/20.
//  Copyright © 2020 Paul Carroll. All rights reserved.
//

import SwiftUI

struct MiscWeatherView: View {
    let leftLabel: String
    let leftValue: String
    let rightLabel: String
    let rightValue: String
    
    var body: some View {
        HStack {
            VStack {
                Text(leftLabel)
                    .font(.system(size: 12))
                    .opacity(0.9)
                Text(leftValue)
                    .font(.system(size: 20))
            }
            Spacer()
            VStack {
                Text(rightLabel)
                    .font(.system(size: 12))
                    .opacity(0.9)
                Text(rightValue)
                    .font(.system(size: 20))
            }
        }
        Divider()
            .padding(.leading, 0)
            .background(Color.white)
    }
}

struct MiscWeatherSectionView: View {
    @ObservedObject var viewModel: WeatherViewModel
    
    var body: some View {
        if let sunrise = viewModel.allWeatherData?.current.sunrise
           , let sunset = viewModel.allWeatherData?.current.sunset {
            MiscWeatherView(leftLabel: "SUNRISE", leftValue: Date(timeIntervalSince1970: TimeInterval(sunrise)).time,
                            rightLabel: "SUNSET", rightValue: Date(timeIntervalSince1970: TimeInterval(sunset)).time)
        }
        if let humidity = viewModel.allWeatherData?.current.humidity
           , let windSpeed = viewModel.allWeatherData?.current.wind_speed
           , let windDegrees = viewModel.allWeatherData?.current.wind_deg {
            MiscWeatherView(leftLabel: "HUMIDITY", leftValue: "\(humidity)",
                            rightLabel: "WIND", rightValue: "\(windSpeed) \(windDegrees)°")
        }
        
    }
}

struct MiscWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        MiscWeatherSectionView(viewModel: WeatherViewModel())
    }
}
