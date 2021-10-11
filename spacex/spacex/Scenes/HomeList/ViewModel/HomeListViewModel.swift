//
//  HomeListViewModel.swift
//  top-songs
//
//  Created by Danilo Camarotto on 12/09/21.
//

import UIKit
import RxSwift

protocol HomeListViewModelProtocol: AnyObject {
    var delegate: HomeListViewControllerDelegate? { get set }
}

struct TopAlbumModel {
    let id: String
    let name: String
    let image: String
}

class HomeListViewModel {
    
    weak var delegate: HomeListViewControllerDelegate?
    weak var coordinator: TopAlbumsCoordinatorProtocol?
    private let service: HomeListServiceProtocol
    
    private let disposeBag = DisposeBag()
    
    init(coordinator: TopAlbumsCoordinatorProtocol, service: HomeListServiceProtocol) {
        self.coordinator = coordinator
        self.service = service
    }
    
}

extension HomeListViewModel: HomeListViewModelProtocol {
    
}
