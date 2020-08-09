//
//  ContentView.swift
//  Weather-SwiftUI
//
//  Created by Paul Carroll on 8/9/20.
//  Copyright © 2020 Paul Carroll. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    LocationView()
                    LocationView()
                    LocationView()
                }
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
