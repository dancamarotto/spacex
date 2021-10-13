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
    
    func updateData()
}

class HomeListViewController: UIViewController {
    
    private let viewModel: HomeListViewModelProtocol
    
    private lazy var homeListView: HomeListView = {
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
        view = homeListView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchData()
    }
    
}

extension HomeListViewController: HomeListViewControllerDelegate {
    func updateData() {
        homeListView.reloadData()
    }
}

extension HomeListViewController: HomeListViewDelegate {
    func numberOfRows(in section: Int) -> Int {
        viewModel.numberOfRows(in: section)
    }
    
    func titleForHeader(in section: Int) -> String {
        viewModel.titleForHeader(in: section)
    }
    
    func getCompanyInfoCellModel() -> CompanyInfoCellModel? {
        viewModel.getCompanyInfoCellModel()
    }
    
    func getLaunchCellModel(at index: Int) -> LaunchCellModel {
        viewModel.getLaunchCellModel(at: index)
    }
}
