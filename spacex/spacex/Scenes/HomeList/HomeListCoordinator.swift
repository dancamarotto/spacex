//
//  HomeListCoordinator.swift
//  top-songs
//
//  Created by Danilo Camarotto on 12/09/21.
//

import UIKit

protocol TopAlbumsCoordinatorProtocol: AnyObject {
//    func goToAlbumDetails(withID id: String)
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
        let service = HomeListService(network: Network())
        let viewModel = HomeListViewModel(coordinator: self, service: service)
        let view = HomeListViewController(viewModel: viewModel)
        viewModel.delegate = view
        navigationController.pushViewController(view, animated: true)
    }
}

extension HomeListCoordinator: TopAlbumsCoordinatorProtocol {
//    func goToAlbumDetails(withID id: String) {
//        let coordinator = AlbumDetailsCoordinator(navigationController: navigationController, albumID: id)
//        childCoordinators.append(coordinator)
//        coordinator.start()
//    }
}
