//
//  PokedexRow.swift
//  Pokodex_UIKit
//
//  Created by MehrDad on 03.12.2022.
//

import UIKit

class PokedexRow: UITableViewCell {

    static let identifier = "PokedexRow"
    
    var cellView = UIView()
    var pokemonImageView = UIImageView()
    var pokemonNameLabel = UILabel()
    var pokemonIdLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureCellView()
        configureImageView()
        configureIdLabel()
        configureNameView()
        
        setCellViewConstraints()
        setImageViewConstraints()
        setIdViewConstraints()
        setNameViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData() {
        //mock data
        let name = "bulbausaur"
        let id = 1
        
        pokemonNameLabel.text = name
        pokemonIdLabel.text =  "#" + String(format: "%03d", id)
        cellView.backgroundColor = .green
        pokemonImageView.image = UIImage(named: name)
        
    }
    
    func configureCellView() {
        cellView.layer.borderColor = UIColor.gray.cgColor
        cellView.layer.borderWidth = 2
        cellView.layer.cornerRadius = 20
        self.addSubview(cellView)
    }
    
    func configureImageView() {
        pokemonImageView.backgroundColor = .systemGroupedBackground
        pokemonImageView.contentMode = .scaleAspectFit
        pokemonImageView.backgroundColor = .white
        pokemonImageView.layer.cornerRadius = 50
        cellView.addSubview(pokemonImageView)
    }
    
    func configureNameView() {
        pokemonNameLabel.font = .systemFont(ofSize: 16, weight: .bold)
        cellView.addSubview(pokemonNameLabel)
    }
    
    func configureIdLabel() {
        pokemonIdLabel.font = .systemFont(ofSize: 16, weight: .bold)
        cellView.addSubview(pokemonIdLabel)
    }
    
    func setCellViewConstraints() {
        cellView.translatesAutoresizingMaskIntoConstraints = false
        cellView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        cellView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        cellView.heightAnchor.constraint(equalTo: heightAnchor, constant: -20).isActive = true
        cellView.widthAnchor.constraint(equalTo: widthAnchor, constant: -20).isActive = true
    }
    
    func setImageViewConstraints() {
        pokemonImageView.translatesAutoresizingMaskIntoConstraints = false
        pokemonImageView.centerYAnchor.constraint(equalTo: cellView.centerYAnchor, constant: -30).isActive = true
        pokemonImageView.centerXAnchor.constraint(equalTo: cellView.centerXAnchor).isActive = true
        pokemonImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        pokemonImageView.widthAnchor.constraint(equalTo: pokemonImageView.heightAnchor).isActive = true
    }
    
    func setIdViewConstraints() {
        pokemonIdLabel.translatesAutoresizingMaskIntoConstraints = false
        pokemonIdLabel.topAnchor.constraint(equalTo: pokemonImageView.bottomAnchor, constant: 10).isActive = true
        pokemonIdLabel.centerXAnchor.constraint(equalTo: cellView.centerXAnchor).isActive = true
    }
    
    func setNameViewConstraints() {
        pokemonNameLabel.translatesAutoresizingMaskIntoConstraints = false
        pokemonNameLabel.topAnchor.constraint(equalTo: pokemonIdLabel.bottomAnchor).isActive = true
        pokemonNameLabel.centerXAnchor.constraint(equalTo: cellView.centerXAnchor).isActive = true
    }

}
