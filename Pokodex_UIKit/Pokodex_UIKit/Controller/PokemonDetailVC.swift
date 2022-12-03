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
    
    //MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavBarItem()
        
        configureCardView()
        configureNameLabel()
        configureImageView()
        
        setCardViewConstraints()
        setImageViewConstraints()
        setNameLabelConstraints()
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
