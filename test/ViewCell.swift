//
//  ViewCell.swift
//  test
//
//  Created by Pedro Henrique on 16/04/24.
//

import UIKit

final class ViewCell: UIView {
    
    private lazy var stackView: UIStackView = {
        let element = UIStackView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.axis = .vertical
        element.alignment = .leading
        element.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        element.isLayoutMarginsRelativeArrangement = true
        element.distribution = .fillEqually
        return element
    }()
    
    lazy var idLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.font = .systemFont(ofSize: 16)
        element.text = "Olá"
        return element
    }()
    
    lazy var nameLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.font = .systemFont(ofSize: 16)
        return element
    }()
    
    lazy var typeLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.font = .systemFont(ofSize: 16)
        return element
    }()
    
    lazy var descriptionLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.font = .systemFont(ofSize: 16)
        return element
    }()
    
    //MARK: - Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildHierachy()
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildHierachy() {
        self.addSubview(stackView)
        stackView.addArrangedSubview(idLabel)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(typeLabel)
        stackView.addArrangedSubview(descriptionLabel)
    }
    
    func setupConstraint() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}
