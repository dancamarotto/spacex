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
    
    func fetchData()
    func numberOfRows(in section: Int) -> Int
    func titleForHeader(in section: Int) -> String
    func getCompanyInfoCellModel() -> CompanyInfoCellModel?
    func getLaunchCellModel(at index: Int) -> LaunchCellModel
    func didSelectLaunch(option: LaunchOption, at index: Int)
}

class HomeListViewModel {
    
    weak var delegate: HomeListViewControllerDelegate?
    weak var coordinator: TopAlbumsCoordinatorProtocol?
    private let service: HomeListServiceProtocol
    private let disposeBag = DisposeBag()
    
    private var companyModel: CompanyModel?
    private var launches: [LaunchModel] = []
    
    init(coordinator: TopAlbumsCoordinatorProtocol, service: HomeListServiceProtocol) {
        self.coordinator = coordinator
        self.service = service
    }
    
}

extension HomeListViewModel: HomeListViewModelProtocol {
    func fetchData() {
        delegate?.startLoading()
        
        Single
            .zip(service.fetchCompanyInfo(), service.fetchLaunches(),
                 resultSelector: { [weak self] companyInfo, launches in
                let company = CompanyModel(companyInfo)
                self?.companyModel = company
                
                for launch in launches {
                    self?.launches.append(LaunchModel(launch))
                }
                
                self?.delegate?.stopLoading()
                self?.delegate?.updateData()
            })
            .observe(on: MainScheduler.instance)
            .subscribe(onFailure: { [weak self] error in
                self?.delegate?.stopLoading()
                print(error)
            })
            .disposed(by: disposeBag)
    }
    
    func numberOfRows(in section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return launches.count
        default:
            return 0
        }
    }
    
    func titleForHeader(in section: Int) -> String {
        switch section {
        case 0:
            return "COMPANY"
        case 1:
            return "LAUNCHES"
        default:
            return ""
        }
    }
    
    func getCompanyInfoCellModel() -> CompanyInfoCellModel? {
        guard let model = companyModel else { return nil }
        return CompanyInfoCellModel(model)
    }
    
    func getLaunchCellModel(at index: Int) -> LaunchCellModel {
        LaunchCellModel(launches[index])
    }
    
    func didSelectLaunch(option: LaunchOption, at index: Int) {
        guard let link = launches[index].getOptionUrl(for: option),
              let url = URL(string: link) else {
            let error = "Invalid, please select another option"
            delegate?.showError(withMessage: error)
            return
        }
        coordinator?.open(url)
    }
}
