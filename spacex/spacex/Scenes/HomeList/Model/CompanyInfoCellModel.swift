//
//  CompanyInfoCellModel.swift
//  spacex
//
//  Created by Danilo Camarotto on 12/10/21.
//

import Foundation

struct CompanyInfoCellModel {
    let info: String
    
    init(_ data: CompanyModel) {
        info = "\(data.name) was founded by \(data.founder) in \(data.foundationYear). It has now \(data.employees) employees, \(data.launchSites) launch sites, and is valued at \(data.valuationCurrency)"
    }
}
