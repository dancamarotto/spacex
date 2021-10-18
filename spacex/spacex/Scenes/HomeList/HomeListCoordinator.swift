//
//  HomeListCoordinator.swift
//  top-songs
//
//  Created by Danilo Camarotto on 12/09/21.
//

import UIKit

extension DateFormatter {
    static let iso8601Full: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
      }()
}

protocol TopAlbumsCoordinatorProtocol: AnyObject {
    func open(_ url: URL)
}

class HomeListCoordinator {
    internal var navigationController: UINavigationController
    internal var childCoordinators = [Coordinator]()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

extension HomeListCoordinator: Coordinator {
    func start() {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Full)
        let network = Network(decoder: decoder)
        let service = HomeListService(network: network)
        let viewModel = HomeListViewModel(coordinator: self, service: service)
        let view = HomeListViewController(viewModel: viewModel)
        viewModel.delegate = view
        navigationController.pushViewController(view, animated: true)
    }
}

extension HomeListCoordinator: TopAlbumsCoordinatorProtocol {
    func open(_ url: URL) {
        UIApplication.shared.open(url)
    }
}
