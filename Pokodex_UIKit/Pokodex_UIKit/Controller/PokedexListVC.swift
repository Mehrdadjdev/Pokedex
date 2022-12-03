//
//  PokedexListVC.swift
//  Pokodex_UIKit
//
//  Created by MehrDad on 03.12.2022.
//

import UIKit

class PokedexListVC: UIViewController {
    
    //MARK: - Properties
    private var tableView = UITableView()
    private var search = UISearchController()

    //MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Pokedex"
        
        configureTableView()
        configureSearchBar()
        
        setTableViewConstraints()
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
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PokedexRow.identifier, for: indexPath) as! PokedexRow
        cell.setData()
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
            
        }
        tableView.reloadData()
    }
}
