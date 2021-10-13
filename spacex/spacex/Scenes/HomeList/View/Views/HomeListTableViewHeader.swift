//
//  HomeListTableViewHeader.swift
//  spacex
//
//  Created by Danilo Camarotto on 12/10/21.
//

import UIKit

class HomeListTableViewHeader: UITableViewHeaderFooterView {
    
    static let reuseIdentifier = "homeListTableViewHeader"
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .avenirNextFont(ofSize: 16)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupHeader(title: String) {
        titleLabel.text = title
    }
    
}

extension HomeListTableViewHeader: ViewCoded {
    func addViews() {
        contentView.addSubview(titleLabel)
    }
    
    func addConstraints() {
        addConstraints([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    func setupViews() {
        contentView.backgroundColor = .black
    }
}
