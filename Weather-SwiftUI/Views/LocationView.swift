//
//  LocationView.swift
//  Weather-SwiftUI
//
//  Created by Paul Carroll on 8/9/20.
//  Copyright © 2020 Paul Carroll. All rights reserved.
//

import SwiftUI

struct LocationView: View {
    let currentTemp: Int
    
    var body: some View {
        VStack {
            VStack {
                Text("<Austin>")
                    .font(.title)
                    .fontWeight(.medium)
                Text("<Condition>")
                    .font(.body)
                Text("\(currentTemp)°")
                    .font(.system(size: 50))
            }
            .foregroundColor(.white)
            
            ScrollView(.vertical, showsIndicators: false, content: {
                HStack {
                    Text("day of week")
                    Text("TODAY")
                    Spacer()
                    Text("high")
                        .padding(.trailing)
                    Text("low")
                }
                Divider()
                    .padding(.leading, 0)
                    .background(Color.white)
                ScrollView(.horizontal, showsIndicators: false, content: {
                    HourlyWeatherView(time: "xxpm", condition: "sunny", temp: "xx")
                })
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
        LocationView(currentTemp: 00)
    }
}
