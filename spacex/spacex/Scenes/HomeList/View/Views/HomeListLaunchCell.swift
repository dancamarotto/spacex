//
//  HomeListLaunchCell.swift
//  spacex
//
//  Created by Danilo Camarotto on 12/10/21.
//

import UIKit
import Kingfisher

class HomeListLaunchCell: UITableViewCell {
    
    static let reuseIdentifier = "homeListLaunchCell"
    
    private lazy var missionImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var missionNameLabel: UILabel = {
        let label = UILabel()
        label.font = .avenirNextFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dateTimeLabel: UILabel = {
        let label = UILabel()
        label.font = .avenirNextFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var rocketLabel: UILabel = {
        let label = UILabel()
        label.font = .avenirNextFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var daysLaunchLabel: UILabel = {
        let label = UILabel()
        label.font = .avenirNextFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var launchSuccessLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
        missionImageView.image = nil
        missionNameLabel.text = nil
        dateTimeLabel.text = nil
        rocketLabel.text = nil
        daysLaunchLabel.text = nil
        launchSuccessLabel.text = nil
    }
    
    func setupCell(_ data: LaunchCellModel?) {
        missionImageView.kf.setImage(with: data?.patchImage)
        missionNameLabel.text = data?.name
        dateTimeLabel.text = data?.dateAndTime
        rocketLabel.text = data?.rocketInfo
        daysLaunchLabel.text = data?.daysLaunch
        launchSuccessLabel.text = data?.launchSuccess
    }
    
}

extension HomeListLaunchCell: ViewCoded {
    func addViews() {
        addSubview(missionImageView)
        addSubview(missionNameLabel)
        addSubview(dateTimeLabel)
        addSubview(rocketLabel)
        addSubview(daysLaunchLabel)
        addSubview(launchSuccessLabel)
        addSubview(separatorView)
    }
    
    func addConstraints() {
        addConstraints([
            missionImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            missionImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            missionImageView.heightAnchor.constraint(equalToConstant: 30),
            missionImageView.widthAnchor.constraint(equalToConstant: 30),
            
            missionNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            missionNameLabel.leadingAnchor.constraint(equalTo: missionImageView.trailingAnchor, constant: 5),
            
            dateTimeLabel.topAnchor.constraint(equalTo: missionNameLabel.bottomAnchor),
            dateTimeLabel.leadingAnchor.constraint(equalTo: missionImageView.trailingAnchor, constant: 5),
            
            rocketLabel.topAnchor.constraint(equalTo: dateTimeLabel.bottomAnchor),
            rocketLabel.leadingAnchor.constraint(equalTo: missionImageView.trailingAnchor, constant: 5),
            
            daysLaunchLabel.topAnchor.constraint(equalTo: rocketLabel.bottomAnchor),
            daysLaunchLabel.leadingAnchor.constraint(equalTo: missionImageView.trailingAnchor, constant: 5),
//            daysLaunchLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
            launchSuccessLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            launchSuccessLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            separatorView.topAnchor.constraint(equalTo: daysLaunchLabel.bottomAnchor, constant: 10),
            separatorView.leadingAnchor.constraint(equalTo: leadingAnchor),
            separatorView.trailingAnchor.constraint(equalTo: trailingAnchor),
            separatorView.bottomAnchor.constraint(equalTo: bottomAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
}
