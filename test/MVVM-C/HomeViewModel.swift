//  
//  HomeViewModel.swift
//  test
//
//  Created by Pedro Henrique on 30/04/24.
//

import Combine

protocol HomeViewModelProtocol: AnyObject {
    func success()
    func failure()
}

protocol HomeViewModeling: AnyObject {
    var delegate: HomeViewModelProtocol? { get set }
}

final class HomeViewModel: HomeViewModeling {


    // MARK: - Initializtion
    
    weak var delegate: HomeViewModelProtocol?
    
    let coordinator: HomeCoordinator

    init(coordinator: HomeCoordinator) {
        self.coordinator = coordinator

    }

}
