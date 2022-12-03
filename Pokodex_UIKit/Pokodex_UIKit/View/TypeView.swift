//
//  TypeView.swift
//  Pokodex_UIKit
//
//  Created by MehrDad on 03.12.2022.
//

import UIKit

class TypeView: UIView {

    //MARK: - Properties
    var typeLabel = UILabel()

    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)

        configureTypeLabel()
        
        setTypeLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Data set
    func setData(type: String) {
        typeLabel.backgroundColor = .green
        typeLabel.text = type
    }
    
    //MARK: - View Configuration
    func configureTypeLabel() {
        typeLabel.font = .systemFont(ofSize: 18)
        typeLabel.layer.cornerRadius = 8
        typeLabel.textAlignment = .center
        typeLabel.textColor = .white
        typeLabel.clipsToBounds = true
        addSubview(typeLabel)
    }
    
    //MARK: - View Constraints
    func setTypeLabelConstraints() {
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        typeLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        typeLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        typeLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
}
