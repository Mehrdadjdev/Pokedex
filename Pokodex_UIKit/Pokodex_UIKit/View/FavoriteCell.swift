//
//  FavoriteCell.swift
//  Pokodex_UIKit
//
//  Created by MehrDad on 03.12.2022.
//

import UIKit

class FavoriteCell: UICollectionViewCell {
    
    static let identifier = "FavoriteCell"
    
    var pokemonImageView = UIImageView()
    var pokemonNameLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureImageView()
        configureNameLabel()
        backgroundColor = .systemRed
        layer.cornerRadius = 30
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
    
    func configureImageView() {
        pokemonImageView.image = UIImage(named: "bulbausaur")
        pokemonImageView.contentMode = .scaleAspectFit
        pokemonImageView.clipsToBounds = true
        pokemonImageView.backgroundColor = .white
        pokemonImageView.layer.cornerRadius = 30
        addSubview(pokemonImageView)
    }
    
    func configureNameLabel() {
        pokemonNameLabel.text = "bulbausaur"
        pokemonNameLabel.textAlignment = .center
        pokemonNameLabel.textColor = .white
        addSubview(pokemonNameLabel)
    }
    
    
}
