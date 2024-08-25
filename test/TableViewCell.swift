//
//  UITableViewCell.swift
//  test
//
//  Created by Pedro Henrique on 16/04/24.
//

import UIKit

final class TableViewCell: UITableViewCell {
    
    static let identifier = "TableViewCell"
    
    lazy var viewScreen: ViewCell = {
        let element = ViewCell()
        return element
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildHierarchy()
        setupConstraints()
        applyAdditionalChanges()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func prepareCell(pokemon: PokemonModel) {
        viewScreen.idLabel.text = String(pokemon.id)
        viewScreen.nameLabel.text = pokemon.name
        viewScreen.typeLabel.text = pokemon.type
        viewScreen.descriptionLabel.text = pokemon.description
    }
    
    func buildHierarchy() {
        contentView.addSubview(viewScreen)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            viewScreen.topAnchor.constraint(equalTo: contentView.topAnchor),
            viewScreen.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            viewScreen.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            viewScreen.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
    func applyAdditionalChanges() {
        contentView.backgroundColor = .clear
    }
}
