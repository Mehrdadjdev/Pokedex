//
//  FavoriteCell.swift
//  Pokodex_UIKit
//
//  Created by MehrDad on 03.12.2022.
//

import UIKit

class FavoriteCell: UICollectionViewCell {
    
    static let identifier = "FavoriteCell"
    
    //MARK: - Properties
    var pokemonImageView = UIImageView()
    var pokemonNameLabel = UILabel()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureImageView()
        configureNameLabel()
        
        layer.cornerRadius = 30
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Configure view
    override func layoutSubviews() {
        super.layoutSubviews()
        
        pokemonNameLabel.frame = CGRect(x: 5,
                                        y: frame.size.height - 40,
                                        width: frame.size.width - 10,
                                        height: 40)
        
        pokemonImageView.frame = CGRect(x: 5,
                                        y: 5,
                                        width: frame.size.width - 10,
                                        height: frame.size.height - 35)
        
    }
    
    func setData(pokemon: Pokemon) {
        pokemonNameLabel.text = pokemon.name
        backgroundColor = UIColor(named: pokemon.types[0].type.name)
        
        Task {
            do {
                async let data = NetworkService.shared.fetchData(for: pokemon.sprites.other.officialArtwork.front_default)
                if let image = try await UIImage(data: data) {
                    pokemonImageView.image = image
                }
            } catch {
                pokemonImageView.image = UIImage(systemName: "questionmark.circle.fill")!
                pokemonImageView.tintColor = .tertiaryLabel
            }
        }
    }
    
    func configureImageView() {
        pokemonImageView.contentMode = .scaleAspectFit
        pokemonImageView.clipsToBounds = true
        pokemonImageView.backgroundColor = .white
        pokemonImageView.layer.cornerRadius = 30
        addSubview(pokemonImageView)
    }
    
    func configureNameLabel() {
        pokemonNameLabel.textAlignment = .center
        pokemonNameLabel.textColor = .white
        pokemonNameLabel.font = .systemFont(ofSize: 15)
        addSubview(pokemonNameLabel)
    }
    
    
}
