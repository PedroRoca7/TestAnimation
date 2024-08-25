//
//  RootViewController.swift
//  test
//
//  Created by Pedro Henrique on 07/08/24.
//

import Foundation
import UIKit

final class RootViewController: UIViewController {
    
    let nav = UINavigationController()
    
    private var buttonSheet: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .blue
        button.setTitle("Show", for: .normal)
        button.heightAnchor.constraint(equalToConstant: 200).isActive = true
        button.widthAnchor.constraint(equalToConstant: 200).isActive = true
    
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        buttonSheet.addTarget(self, action: #selector(showButtonSheet), for: .touchUpInside)
        setupConstraints()
    }
    
    private func setupConstraints() {
        view.addSubview(buttonSheet)
        
        NSLayoutConstraint.activate([
            buttonSheet.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonSheet.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    @objc func showButtonSheet() {
        let vc = TesteViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
