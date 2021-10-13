//
//  ViewCoded.swift
//  top-songs
//
//  Created by Danilo Camarotto on 12/09/21.
//

import Foundation

/// The `ViewCoded` protocol is used to implement the views of the scenes.
/// Since we do not use `Storyboards`, all the views are implemented programatically.
protocol ViewCoded {
    
    /// Used to add all the necessary views, like buttons or labels.
    func addViews()
    
    /// Used to add all the necessary constraints to organize the view components.
    func addConstraints()
    
    /// Used to add any additional information.
    func setupViews()
}

extension ViewCoded {
    func setupViewCode() {
        addViews()
        addConstraints()
        setupViews()
    }
    
    func setupViews() {
        // No need for implementation
    }
}
