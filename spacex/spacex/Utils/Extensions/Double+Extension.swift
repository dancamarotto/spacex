//
//  Double+Extension.swift
//  spacex
//
//  Created by Danilo Camarotto on 15/10/21.
//

import Foundation

extension Double {
    public var dollars: String? {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.numberStyle = .currency
        return formatter.string(from: self as NSNumber)
    }
    
    public var withCommas: String? {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: self as NSNumber)
    }
}
