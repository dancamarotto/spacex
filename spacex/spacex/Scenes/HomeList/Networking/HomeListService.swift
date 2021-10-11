//
//  HomeListService.swift
//  top-songs
//
//  Created by Danilo Camarotto on 12/09/21.
//

import Foundation
import RxSwift

protocol HomeListServiceProtocol {
    var network: Networking { get }
}

class HomeListService {
    
    let network: Networking
    
    private let paramMethod = ["method" : "tag.gettopalbums"]
    private let paramTag = ["tag" : "hip-hop"]
    private let paramFormat = ["format" : "json"]
    
    init(network: Networking = Network()) {
        self.network = network
    }
    
}

extension HomeListService: HomeListServiceProtocol {
    
}
