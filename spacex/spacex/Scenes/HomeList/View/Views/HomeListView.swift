//
//  HomeListView.swift
//  top-songs
//
//  Created by Danilo Camarotto on 12/09/21.
//

import UIKit

protocol HomeListViewDelegate: AnyObject {
    func numberOfRows(in section: Int) -> Int
    func titleForHeader(in section: Int) -> String
    func getCompanyInfoCellModel() -> CompanyInfoCellModel?
    func getLaunchCellModel(at index: Int) -> LaunchCellModel
}

class HomeListView: UIView {
    
    weak var delegate: HomeListViewDelegate?
    
    private let headerId = HomeListTableViewHeader.reuseIdentifier
    private let infoCellId = HomeListCompanyInfoCell.reuseIdentifier
    private let launchCellId = HomeListLaunchCell.reuseIdentifier
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(HomeListTableViewHeader.self, forHeaderFooterViewReuseIdentifier: headerId)
        tableView.register(HomeListCompanyInfoCell.self, forCellReuseIdentifier: infoCellId)
        tableView.register(HomeListLaunchCell.self, forCellReuseIdentifier: launchCellId)
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    convenience init(delegate: HomeListViewDelegate? = nil) {
        self.init(frame: .zero)
        self.delegate = delegate
        setupViewCode()
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
}

extension HomeListView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        delegate?.numberOfRows(in: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        40
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerId) as? HomeListTableViewHeader else {
            return UIView()
        }
        let title = delegate?.titleForHeader(in: section) ?? ""
        header.setupHeader(title: title)
        
        return header
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView
                    .dequeueReusableCell(withIdentifier: infoCellId,
                                         for: indexPath) as? HomeListCompanyInfoCell else {
                        return UITableViewCell()
                    }
            cell.setupCell(delegate?.getCompanyInfoCellModel())
            return cell
        case 1:
            guard let cell = tableView
                    .dequeueReusableCell(withIdentifier: launchCellId,
                                         for: indexPath) as? HomeListLaunchCell else {
                        return UITableViewCell()
                    }
            cell.setupCell(delegate?.getLaunchCellModel(at: indexPath.row))
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}

extension HomeListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }
}

extension HomeListView: ViewCoded {
    func addViews() {
        addSubview(tableView)
    }
    
    func addConstraints() {
        addConstraints([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
    }
    
    func setupViews() {
        backgroundColor = .white
    }
}
