//
//  ContentView.swift
//  Weather-SwiftUI
//
//  Created by Paul Carroll on 8/9/20.
//  Copyright © 2020 Paul Carroll. All rights reserved.
//

import SwiftUI

struct WeatherView: View {
    @ObservedObject var viewModel = WeatherViewModel()
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    LocationView(viewModel: viewModel)
//                    LocationView()
//                    LocationView()
                }
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
