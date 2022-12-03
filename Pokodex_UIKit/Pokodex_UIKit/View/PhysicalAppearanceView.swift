//
//  PhysicalAppearanceView.swift
//  Pokodex_UIKit
//
//  Created by MehrDad on 03.12.2022.
//

import UIKit

class PhysicalAppearanceView: UIView {

    var iconView = UIImageView()
    var titleLabel = UILabel()
    var physicalAppearance = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureIconView()
        configureTitleLable()
        configureProperty()
        
        setIconConstraints()
        setTitleConstraints()
        setPropertyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(title: String, property: String) {
        
        iconView.image = UIImage(named: title)
        titleLabel.text = title
        physicalAppearance.text = property
        
    }
    
    func configureIconView() {
        iconView.contentMode = .scaleAspectFit
        addSubview(iconView)
    }
    
    func configureTitleLable() {
        titleLabel.font = .systemFont(ofSize: 15)
        titleLabel.textColor = .gray
        addSubview(titleLabel)
    }
    
    func configureProperty() {
        physicalAppearance.font = .systemFont(ofSize: 17)
        physicalAppearance.textColor = .black
        addSubview(physicalAppearance)
    }
    
    func setIconConstraints() {
        iconView.translatesAutoresizingMaskIntoConstraints = false
        iconView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        iconView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        iconView.heightAnchor.constraint(equalToConstant: 25).isActive = true
        iconView.widthAnchor.constraint(equalToConstant: 25).isActive = true

    }
    
    func setTitleConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: iconView.bottomAnchor, constant: 10).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    func setPropertyConstraints() {
        physicalAppearance.translatesAutoresizingMaskIntoConstraints = false
        physicalAppearance.centerYAnchor.constraint(equalTo: iconView.centerYAnchor).isActive = true
        physicalAppearance.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 10).isActive = true
        physicalAppearance.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }

}
