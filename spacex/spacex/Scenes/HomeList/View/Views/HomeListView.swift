//
//  HomeListView.swift
//  top-songs
//
//  Created by Danilo Camarotto on 12/09/21.
//

import UIKit

protocol HomeListViewDelegate: AnyObject {
    
}

class HomeListView: UIView {
    
    weak var delegate: HomeListViewDelegate?
    
    convenience init(delegate: HomeListViewDelegate? = nil) {
        self.init(frame: .zero)
        self.delegate = delegate
        setupViewCode()
    }
    
}

extension HomeListView: ViewCoded {
    func addViews() {
        
    }
    
    func addConstraints() {
        
    }
    
    func setupViews() {
        backgroundColor = .white
    }
}
