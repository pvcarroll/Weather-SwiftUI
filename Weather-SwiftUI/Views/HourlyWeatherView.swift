//
//  HourlyWeatherView.swift
//  Weather-SwiftUI
//
//  Created by Paul Carroll on 10/7/20.
//  Copyright © 2020 Paul Carroll. All rights reserved.
//

import SwiftUI

struct HourlyWeatherView: View {
    let time: String
    let condition: String
    let temp: String
    let isDaytime: Bool
    
    var body: some View {
        VStack {
            Text(time)
            imageForCondition(condition)
                .resizable()
                .frame(width: 20, height: 20, alignment: .center)
            Text(temp)
        }
    }
    
    private func imageForCondition(_ condition: String) -> Image {
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
}

struct HourlyWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        HourlyWeatherView(time: "5pm", condition: "Clear", temp: "89", isDaytime: true)
    }
}
