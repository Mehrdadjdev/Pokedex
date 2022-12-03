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
        layer.cornerRadius = 10
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        pokemonNameLabel.frame = CGRect(x: 5,
                                        y: frame.size.height - 50,
                                        width: frame.size.width - 10,
                                        height: 50)
        
        pokemonImageView.frame = CGRect(x: 5,
                                        y: 0,
                                        width: frame.size.width - 10,
                                        height: frame.size.height - 50)
        
    }
    
    func configureImageView() {
        pokemonImageView.image = UIImage(named: "bulbausaur")
        pokemonImageView.contentMode = .scaleAspectFit
        pokemonImageView.clipsToBounds = true
        addSubview(pokemonImageView)
    }
    
    func configureNameLabel() {
        pokemonNameLabel.text = "bulbausaur"
        pokemonNameLabel.textAlignment = .center
        addSubview(pokemonNameLabel)
    }
    
    
}
