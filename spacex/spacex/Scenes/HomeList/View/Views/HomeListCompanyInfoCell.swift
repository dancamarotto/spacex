//
//  HomeListCompanyInfoCell.swift
//  spacex
//
//  Created by Danilo Camarotto on 12/10/21.
//

import UIKit

class HomeListCompanyInfoCell: UITableViewCell {
    
    static let reuseIdentifier = "homeListCompanyInfoCell"
    
    private lazy var infoTextView: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .avenirNextFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        infoTextView.text = nil
    }
    
    func setupCell(_ data: CompanyInfoCellModel?) {
        infoTextView.text = data?.info
    }
    
}

extension HomeListCompanyInfoCell: ViewCoded {
    func addViews() {
        addSubview(infoTextView)
    }
    
    func addConstraints() {
        addConstraints([
            infoTextView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            infoTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            infoTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            infoTextView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
