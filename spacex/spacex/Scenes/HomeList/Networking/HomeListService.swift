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
    
    func fetchCompanyInfo() -> Single<CompanyData>
    func fetchLaunches() -> Single<[LaunchData]>
}

class HomeListService {
    
    let network: Networking
    
    private let baseUrl = "https://api.spacexdata.com/v3"
    
    init(network: Networking = Network()) {
        self.network = network
    }
    
}

extension HomeListService: HomeListServiceProtocol {
    func fetchCompanyInfo() -> Single<CompanyData> {
        network
            .request(url: baseUrl + "/info")
    }
    
    func fetchLaunches() -> Single<[LaunchData]> {
        network
            .request(url: baseUrl + "/launches")
    }
}
