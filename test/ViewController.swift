//
//  ViewController.swift
//  test
//
//  Created by Pedro Henrique on 19/02/24.
//

import UIKit
import Combine

final class ViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let element = UITableView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        element.backgroundColor = .clear
        return element
    }()
    
    private var cancellables = Set<AnyCancellable>()
    private var listPokemons: PokemonsModel = []
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        view.addSubview(tableView)
        setupConstraints()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getListPokemons()
        
    }
    
    func getListPokemons() {
        ServiceManager.shared.getData(type: PokemonModel.self)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print("Error is \(error.localizedDescription)")
                case .finished:
                    print("Finished")
                }
            } receiveValue: { [weak self] pokemonsData in
                self?.listPokemons = pokemonsData
                self?.reloadTableView()
            }
            .store(in: &cancellables)
    }
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listPokemons.count
    }
    
   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as? TableViewCell else { return UITableViewCell() }
        
        cell.prepareCell(pokemon: listPokemons[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
