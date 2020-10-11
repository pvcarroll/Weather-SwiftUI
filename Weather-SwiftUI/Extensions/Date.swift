//
//  Date.swift
//  Weather-SwiftUI
//
//  Created by Paul Carroll on 10/10/20.
//  Copyright © 2020 Paul Carroll. All rights reserved.
//

import Foundation

extension Date {
    func dayOfWeek() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self).capitalized
    }
}
