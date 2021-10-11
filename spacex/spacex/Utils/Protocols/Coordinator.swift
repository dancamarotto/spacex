//
//  Coordinator.swift
//  top-songs
//
//  Created by Danilo Camarotto on 12/09/21.
//

import UIKit

/// Regular `Coordinator` implementation, for all scenes of the application.
protocol Coordinator {
    
    /// The `UINavigationController` responsible for pushing the view.
    var navigationController: UINavigationController { get set }
    
    /// All the coordinator instances created must be stored here to keep reference, otherwise it will be nil inside the ViewModel.
    var childCoordinators: [Coordinator] { get set }
    
    /// Here we instantiate all the necessary classes of the scene and present it.
    func start()
}
