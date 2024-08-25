//  
//  HomeViewController.swift
//  test
//
//  Created by Pedro Henrique on 30/04/24.
//

import Combine
import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - AnyCancellable
    
    var cancellables = Set<AnyCancellable>()
    
    // MARK: - Initialization
    
    lazy var screenView: HomeView = {
        let element = HomeView()
        return element
    }()
    
    let viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle

    override func loadView() {
        super.loadView()
        self.view = screenView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension HomeViewController: HomeViewModelProtocol {
    func success() {
        
    }
    
    func failure() {
        
    }
    
    
}

