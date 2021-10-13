//
//  LaunchRocketData.swift
//  spacex
//
//  Created by Danilo Camarotto on 12/10/21.
//

import Foundation

struct LaunchRocketData: Decodable {
    let id: String
    let name: String
    let type: String
    
    enum CodingKeys: String, CodingKey {
        case id = "rocketId"
        case name = "rocketName"
        case type = "rocketType"
    }
}
