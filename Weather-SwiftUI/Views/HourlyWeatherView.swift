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
    
    var body: some View {
        VStack {
            Text(time)
            Image("sunny")
                .resizable()
                .frame(width: 20, height: 20, alignment: .center)
            Text(temp)
        }
    }
}

struct HourlyWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        HourlyWeatherView(time: "5pm", condition: "sunny", temp: "89")
    }
}
