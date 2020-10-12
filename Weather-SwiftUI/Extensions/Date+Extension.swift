//
//  Date+Extension.swift
//  Weather-SwiftUI
//
//  Created by Paul Carroll on 10/10/20.
//  Copyright © 2020 Paul Carroll. All rights reserved.
//

import Foundation

extension Date {
    var hour: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "ha"
        let hour = dateFormatter.string(from: self)
        return hour
    }
    
    var time: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:ma"
        return dateFormatter.string(from: self)
    }
    
    func dayOfWeek() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self).capitalized
    }
}
