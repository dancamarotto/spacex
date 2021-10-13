//
//  LaunchModel.swift
//  spacex
//
//  Created by Danilo Camarotto on 12/10/21.
//

import Foundation

struct LaunchModel {
    let missionName: String
    let date: String
    let time: String
    let rocket: RocketModel
    let imageUrl: String
    let launchSuccess: Bool
    
    init(_ data: LaunchData) {
        missionName = data.missionName
        date = data.launchDateUTC
        time = data.launchDateUTC
        rocket = RocketModel(name: data.rocket.name, type: data.rocket.type)
        imageUrl = data.links.missionPatch ?? ""
        launchSuccess = data.launchSuccess ?? false
    }
}

struct RocketModel {
    let name: String
    let type: String
}
