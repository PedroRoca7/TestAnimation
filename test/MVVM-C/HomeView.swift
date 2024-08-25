//  
//  HomeView.swift
//  test
//
//  Created by Pedro Henrique on 30/04/24.
//

import UIKit

final class HomeView: UIView {
    
    // MARK: - Lazy properties
    
    
    // MARK: - Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeView: ViewCodeUIView {

    // MARK: - Add Elements e Constraints
    
    func addElementsView() {

    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
        ])
    }
    
    func applyConditionSpecial() {

    }
}
