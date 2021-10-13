//
//  LaunchesData.swift
//  spacex
//
//  Created by Danilo Camarotto on 12/10/21.
//

import Foundation

struct LaunchData: Decodable {
    let flightNumber: Int
    let missionName: String
    let launchDateUTC: String
    let rocket: LaunchRocketData
    let links: LaunchLinksData
    let launchSuccess: Bool?
    
    enum CodingKeys: String, CodingKey {
        case flightNumber, missionName, rocket, links, launchSuccess
        case launchDateUTC = "launchDateUtc"
    }
}
