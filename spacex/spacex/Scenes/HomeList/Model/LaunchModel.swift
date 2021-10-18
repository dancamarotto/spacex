//
//  LaunchModel.swift
//  spacex
//
//  Created by Danilo Camarotto on 12/10/21.
//

import Foundation

struct LaunchModel {
    let missionName: String
    let launchDateUTC: Date
    let date: String
    let time: String
    let rocket: RocketModel
    let imageUrl: String
    let launchSuccess: Bool
    let articleUrl: String?
    let wikipediaUrl: String?
    let videoUrl: String?
    
    
    init(_ data: LaunchData) {
        missionName = data.missionName
        launchDateUTC = data.launchDateUTC
        date = data.launchDateUTC.launchDate
        time = data.launchDateUTC.launchTime
        rocket = RocketModel(name: data.rocket.name, type: data.rocket.type)
        imageUrl = data.links.missionPatch ?? ""
        launchSuccess = data.launchSuccess ?? false
        articleUrl = data.links.articleLink
        wikipediaUrl = data.links.wikipedia
        videoUrl = data.links.videoLink
    }
    
    func getOptionUrl(for option: LaunchOption) -> String? {
        switch option {
        case .article:
            return articleUrl
        case .wikipedia:
            return wikipediaUrl
        case .video:
            return videoUrl
        }
    }
}
