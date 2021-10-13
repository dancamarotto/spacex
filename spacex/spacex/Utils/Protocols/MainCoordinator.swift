//
//  MainCoordinator.swift
//  top-songs
//
//  Created by Danilo Camarotto on 12/09/21.
//

import UIKit

/// The `MainCoordinator` is used once to define the starting point of the application.
/// The class that implements this protocol is called in `AppDelegate`.
protocol MainCoordinator {
    
    /// The `UIWindow` variable which the entire application will be displayed.
    var window: UIWindow { get set }
    
    /// Must keep references to all coordinator instantiateds.
    var childCoordinator: [Coordinator] { get set }
    
    /// Here we instantiate all the necessary classes of the entry point scene and present it.
    func start()
    
}
