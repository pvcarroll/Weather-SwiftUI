//
//  DarkHostingController.swift
//  Weather-SwiftUI
//
//  Created by Paul Carroll on 8/9/20.
//  Copyright © 2020 Paul Carroll. All rights reserved.
//

import SwiftUI

class DarkHostingController<ContentView>: UIHostingController<ContentView> where ContentView: View {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
}
