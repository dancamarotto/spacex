//
//  CompanyData.swift
//  spacex
//
//  Created by Danilo Camarotto on 11/10/21.
//

import Foundation

struct CompanyData: Decodable {
    let name: String
    let founder: String
    let foundationYear: Int
    let employees: Int
    let launchSites: Int
    let valuation: Double
    
    enum CodingKeys: String, CodingKey {
        case name, founder, employees, launchSites, valuation
        case foundationYear = "founded"
    }
}
