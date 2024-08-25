//  
//  HomeFactory.swift
//  test
//
//  Created by Pedro Henrique on 30/04/24.
//

import UIKit

enum HomeFactory {

    static func make(navigationController: UINavigationController) -> HomeViewController {
 
        let coordinator = HomeCoordinator(navigationController: navigationController)
        let viewModel = HomeViewModel(coordinator: coordinator)
        let viewController = HomeViewController(viewModel: viewModel)
        viewModel.delegate = viewController
        
        return viewController
    }
}
