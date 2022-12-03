//
//  PokedexListVC.swift
//  Pokodex_UIKit
//
//  Created by MehrDad on 03.12.2022.
//

import UIKit

class PokedexListVC: UIViewController {
    
    //MARK: - Properties
    let pokemonManager = PokemonManager()
    private var tableView = UITableView()
    private var search = UISearchController()

    //MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        configureSearchBar()
        
        setTableViewConstraints()
        
        Task {
            await pokemonManager.loadPokemons(firstCall: true)
            tableView.reloadData()
        }
    }
    
    //MARK: - View Configuration
    func configureTableView() {
        tableView.rowHeight = 200
        
        tableView.register(PokedexRow.self, forCellReuseIdentifier: PokedexRow.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        view.addSubview(tableView)
    }
    
    func configureSearchBar() {
        search.searchResultsUpdater = self
        self.navigationItem.searchController = search
    }
    
    //MARK: - View Constraints
    func setTableViewConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
}

//MARK: - Table cell Configuration
extension PokedexListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonManager.pokemonFiltered.isEmpty ? pokemonManager.pokemonList.count : pokemonManager.pokemonFiltered.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if !search.isActive && indexPath.row == tableView.numberOfRows(inSection: 0) - 1 {
            Task {
                await pokemonManager.loadPokemons()
                self.tableView.reloadData()
            }
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: PokedexRow.identifier, for: indexPath) as! PokedexRow
        
        if pokemonManager.pokemonFiltered.isEmpty {
            cell.setData(pokemon: pokemonManager.pokemonList[indexPath.row])
        } else {
            cell.setData(pokemon: pokemonManager.pokemonFiltered[indexPath.row])
        }
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailView = PokemonDetailVC()
        detailView.setData()
        navigationController?.pushViewController(detailView, animated: true)
        
    }
}

//MARK: - Search bar function
extension PokedexListVC: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        if searchController.isActive {
            pokemonManager.filterPokemons(by: searchController.searchBar.text ?? "")
        }
        tableView.reloadData()
    }
}
