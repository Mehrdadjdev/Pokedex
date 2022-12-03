//
//  PokemonDetailVC.swift
//  Pokodex_UIKit
//
//  Created by MehrDad on 03.12.2022.
//

import UIKit

class PokemonDetailVC: UIViewController {
    
    //MARK: - Properties
    let imageView = UIImageView()
    let nameLabel = UILabel()
    let cardView = UIView()
    let tableView = UITableView()
    
    //MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavBarItem()
        
        configureCardView()
        configureNameLabel()
        configureImageView()
        configuretableView()
        
        setCardViewConstraints()
        setImageViewConstraints()
        setNameLabelConstraints()
        setTableViewConstraints()
    }
    
    //MARK: - Data Set
    func setData() {
        //mock data
        let name = "bulbausaur"
        
        
        view.backgroundColor = .green
        nameLabel.text = name
        imageView.image = UIImage(named: name)
        
    }
    
    //MARK: - Selectors
    @objc func addPokemonToFavorites() {
        print("add to favorites")
    }
    
    //MARK: - View Configuration
    func configureNavBarItem() {
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "heart"), style: .plain, target: self, action: #selector(addPokemonToFavorites))
        navigationItem.rightBarButtonItem?.tintColor = .red
    }
    
    func configureCardView() {
        cardView.backgroundColor = .white
        cardView.layer.cornerRadius = 53
        view.addSubview(cardView)
    }
    
    func configureNameLabel() {
        nameLabel.textColor = .white
        nameLabel.font = .systemFont(ofSize: 32, weight: .bold)
        view.addSubview(nameLabel)
    }
    
    func configureImageView() {
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
    }
    
    //MARK: - View Constraints
    func setCardViewConstraints() {
        cardView.translatesAutoresizingMaskIntoConstraints = false
        cardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        cardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5).isActive = true
        cardView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -5).isActive = true
        cardView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 2/3).isActive = true
    }
    
    func setImageViewConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.centerYAnchor.constraint(equalTo: cardView.topAnchor, constant: -60).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor).isActive = true
    }
    
    func setNameLabelConstraints() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.centerYAnchor.constraint(equalTo: imageView.topAnchor, constant: -20).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }

}

extension PokemonDetailVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: StatisticRow.identifier, for: indexPath) as! StatisticRow
        cell.setData()
        cell.selectionStyle = .none
        
        return cell
    }
    
    
    func configuretableView() {
        tableView.rowHeight = 50
        tableView.isScrollEnabled = false
        tableView.register(StatisticRow.self, forCellReuseIdentifier: StatisticRow.identifier)
        tableView.delegate = self
        tableView.dataSource = self
    
        view.addSubview(tableView)
    }
    
    func setTableViewConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 160).isActive = true
        tableView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -50).isActive = true
    }
    
}
