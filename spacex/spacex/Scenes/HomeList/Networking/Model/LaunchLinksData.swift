//
//  LaunchLinksData.swift
//  spacex
//
//  Created by Danilo Camarotto on 13/10/21.
//

import Foundation

struct LaunchLinksData: Decodable {
    let missionPatch: String?
    let articleLink: String?
    let wikipedia: String?
    let videoLink: String?
}
