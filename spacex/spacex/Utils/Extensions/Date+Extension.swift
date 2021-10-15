//
//  Date+Extension.swift
//  spacex
//
//  Created by Danilo Camarotto on 15/10/21.
//

import Foundation

extension Date {
    public var launchDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter.string(from: self)
    }
    
    public var launchTime: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: self)
    }
    
    public var daysToNow: Int? {
        let today = Date()
        let calendar = Calendar.current
        
        let date1 = calendar.startOfDay(for: today)
        let date2 = calendar.startOfDay(for: self)

        let components = calendar.dateComponents([.day], from: date1, to: date2)
        return components.day
    }
}
