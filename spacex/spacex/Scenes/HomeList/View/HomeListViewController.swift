//
//  HomeListViewController.swift
//  top-songs
//
//  Created by Danilo Camarotto on 12/09/21.
//

import UIKit

protocol HomeListViewControllerDelegate: AnyObject {
    func startLoading()
    func stopLoading()
}

class HomeListViewController: UIViewController {
    
    private let viewModel: HomeListViewModelProtocol
    
    private lazy var topAlbumsView: HomeListView = {
        HomeListView(delegate: self)
    }()
    
    init(viewModel: HomeListViewModelProtocol)  {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        title = "SpaceX"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = topAlbumsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension HomeListViewController: HomeListViewControllerDelegate {
    
}

extension HomeListViewController: HomeListViewDelegate {
    
}
