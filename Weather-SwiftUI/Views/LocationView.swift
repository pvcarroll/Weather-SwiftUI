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
            .frame(width: UIScreen.main.bounds.width, height: nil, alignment: .center)
            .foregroundColor(.white)
            .background(
                Image("partlyCloudy")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            )
            
            ScrollView(.vertical, showsIndicators: false, content: {
                Text("scroll view")
            })
            .frame(width: UIScreen.main.bounds.width, height: nil, alignment: .center)
            .background(Color.blue)
        }
        .frame(width: UIScreen.main.bounds.width, height: nil, alignment: .center)
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
    }
}
