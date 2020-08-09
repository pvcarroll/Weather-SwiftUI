//
//  LocationView.swift
//  Weather-SwiftUI
//
//  Created by Paul Carroll on 8/9/20.
//  Copyright © 2020 Paul Carroll. All rights reserved.
//

import SwiftUI

struct LocationView: View {
    var body: some View {
        VStack {
            VStack {
                Text("City")
                    .font(.title)
                Text("Condition")
                    .font(.body)
                Text("temp")
                    .font(.title)
            }
            .foregroundColor(.white)
            
            ScrollView(.vertical, showsIndicators: false, content: {
                Text("scroll view")
            })
        }
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
        LocationView()
    }
}
