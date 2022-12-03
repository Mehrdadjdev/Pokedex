//
//  PokemonDetailVC.swift
//  Pokodex_UIKit
//
//  Created by MehrDad on 03.12.2022.
//

import UIKit

class PokemonDetailVC: UIViewController {
    
    //MARK: - Properties
    let pokemon: Pokemon
    
    let imageView = UIImageView()
    let nameLabel = UILabel()
    let cardView = UIView()
    let tableView = UITableView()
    let weight = PhysicalAppearanceView()
    let height = PhysicalAppearanceView()
    let typeLabel = TypeView()
    
    //MARK: - Init
    init(pokemon: Pokemon) {
        self.pokemon = pokemon
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setData()
        
        configureNavBarItem()
        
        configureCardView()
        configureNameLabel()
        configureImageView()
        configuretableView()
        configureWeightHeightView()
        configureTypeView()
        
        setCardViewConstraints()
        setImageViewConstraints()
        setNameLabelConstraints()
        setTableViewConstraints()
        setWeightHeightConstraints()
        setTypeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Data Set
    func setData() {
        view.backgroundColor = UIColor(named: pokemon.types[0].type.name)
        nameLabel.text = pokemon.name.capitalized
        
        Task {
            do {
                async let data = NetworkService.shared.fetchData(for: pokemon.sprites.other.officialArtwork.front_default)
                if let image = try await UIImage(data: data) {
                    imageView.image = image
                }
            } catch {
                imageView.image = UIImage(systemName: "questionmark.circle.fill")!
                imageView.tintColor = .tertiaryLabel
            }
        }
        
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
    
    
    func configureTypeView() {
        if pokemon.types.count == 1 {
            typeLabel.setData(type: pokemon.types[0].type.name)//type.type.name)
            cardView.addSubview(typeLabel)
            typeLabel.centerXAnchor.constraint(equalTo: cardView.centerXAnchor).isActive = true
        } else {
            typeLabel.setData(type: pokemon.types[0].type.name)
            cardView.addSubview(typeLabel)
            typeLabel.centerXAnchor.constraint(equalTo: cardView.centerXAnchor, constant: -70).isActive = true
            
            let secondTypeLabel = TypeView()
            secondTypeLabel.setData(type: pokemon.types[1].type.name)
            cardView.addSubview(secondTypeLabel)
            secondTypeLabel.translatesAutoresizingMaskIntoConstraints = false
            secondTypeLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 60).isActive = true
            secondTypeLabel.centerXAnchor.constraint(equalTo: cardView.centerXAnchor, constant: 70).isActive = true
            
        }
    }
    
    
    func configureWeightHeightView() {
        //mock data
        let weightInt = pokemon.weight
        let heightInt = pokemon.height
        
        let weightDouble = Double(weightInt) / 10
        let weightString = String(format: "%.1f", weightDouble)
        
        let heightDouble = Double(heightInt) / 10
        let heightString = String(format: "%.2f", heightDouble)
        
        weight.setData(title: "weight",
                       property: "\(weightString) Kg")
        
        
        height.setData(title: "height",
                       property: "\(heightString) m")
        
        cardView.addSubview(weight)
        cardView.addSubview(height)
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
    
    func setWeightHeightConstraints() {
        weight.translatesAutoresizingMaskIntoConstraints = false
        height.translatesAutoresizingMaskIntoConstraints = false
        
        weight.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 50).isActive = true
        weight.bottomAnchor.constraint(equalTo: tableView.topAnchor, constant: -20).isActive = true
        
        height.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -50).isActive = true
        height.bottomAnchor.constraint(equalTo: tableView.topAnchor, constant: -20).isActive = true
    }
    
    func setTypeConstraints() {
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 60).isActive = true
        
    }

}

//MARK: - Table View Configuration for showing statistics
extension PokemonDetailVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemon.stats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: StatisticRow.identifier, for: indexPath) as! StatisticRow
        cell.setData(stat: pokemon.stats[indexPath.row], type: pokemon.types[0].type.name)
        cell.selectionStyle = .none
        
        return cell
    }
    
    //MARK: - Table View Configuration
    func configuretableView() {
        tableView.rowHeight = 50
        tableView.isScrollEnabled = false
        tableView.register(StatisticRow.self, forCellReuseIdentifier: StatisticRow.identifier)
        tableView.delegate = self
        tableView.dataSource = self
    
        view.addSubview(tableView)
    }
    
    //MARK: - Table View Constraints
    func setTableViewConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 180).isActive = true
        tableView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -50).isActive = true
    }
    
}
