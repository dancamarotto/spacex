//
//  LaunchCellModel.swift
//  spacex
//
//  Created by Danilo Camarotto on 13/10/21.
//

import Foundation

struct LaunchCellModel {
    let patchImage: URL?
    let name: String
    let dateAndTime: String
    let rocketInfo: String
    let daysLaunch: String
    let launchSuccess: String
    
    init(_ data: LaunchModel) {
        patchImage = URL(string: data.imageUrl)
        name = "Mission: \(data.missionName)"
        dateAndTime = "Date/time: \(data.date)"
        rocketInfo = "Rocket: \(data.rocket.name) / \(data.rocket.type)"
        daysLaunch = "Days since from now:"
        launchSuccess = data.launchSuccess ? "✓" : "𐄂"
    }
}
