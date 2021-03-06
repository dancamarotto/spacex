//
//  CompanyModel.swift
//  spacex
//
//  Created by Danilo Camarotto on 12/10/21.
//

import Foundation

struct CompanyModel {
    
    let name: String
    let founder: String
    let foundationYear: Int
    let employees: Int
    let launchSites: Int
    let valuation: Double
    
    init(_ data: CompanyData) {
        name = data.name
        founder = data.founder
        foundationYear = data.foundationYear
        employees = data.employees
        launchSites = data.launchSites
        valuation = data.valuation
    }
    
    var valuationCurrency: String {
        valuation.dollars ?? "-"
    }
    
}
