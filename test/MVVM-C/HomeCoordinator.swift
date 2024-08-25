//  
//  HomeCoordinator.swift
//  test
//
//  Created by Pedro Henrique on 30/04/24.
//

import UIKit

protocol HomeCoordinating {
   
}

final class HomeCoordinator: HomeCoordinating {
    
    // MARK: - Initializtion
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    
}
