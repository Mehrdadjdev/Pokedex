//
//  StatisticRow.swift
//  Pokodex_UIKit
//
//  Created by MehrDad on 03.12.2022.
//

import UIKit

class StatisticRow: UITableViewCell {
    
    static let identifier = "StatisticRow"
    
    //MARK: - Properties
    let progressView = UIProgressView(progressViewStyle: .bar)
    let percentLabel = UILabel()
    let statLabel = UILabel()
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configurePercentLabel()
        configureProgressView()
        configureNameLabel()
        
        setPercentLabelConstriants()
        setProgressViewConstriants()
        setNameLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Data set
    func setData() {
        //mock data
        let percent = 35
        let title = "HP"
        
        percentLabel.text = String(format: "%03d", percent)
        statLabel.text = title + ":"
        progressView.progress = Float(percent) / 200
        progressView.tintColor = .green
        progressView.trackTintColor = .green.withAlphaComponent(0.2)
    }
    
    //MARK: - View configuration
    func configureProgressView() {
        progressView.center = self.center
        progressView.setProgress(0.5, animated: true)
        progressView.transform = progressView.transform.scaledBy(x: 1, y: 3)
        progressView.layer.cornerRadius = 4
//        progressView.layer.sublayers?[1].cornerRadius = 4
        progressView.subviews[1].clipsToBounds = true
        progressView.layer.masksToBounds = true
        addSubview(progressView)
    }
    
    func configurePercentLabel() {
        percentLabel.font = .systemFont(ofSize: 16, weight: .medium)
        addSubview(percentLabel)
    }
    
    func configureNameLabel() {
        statLabel.font = .systemFont(ofSize: 15, weight: .medium)
        addSubview(statLabel)
    }
    
    //MARK: - View Constraints
    func setPercentLabelConstriants() {
        percentLabel.translatesAutoresizingMaskIntoConstraints = false
        percentLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        percentLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60).isActive = true
    }
    
    func setProgressViewConstriants() {
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        progressView.leadingAnchor.constraint(equalTo: percentLabel.trailingAnchor, constant: 15).isActive = true
        progressView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
    }
 
    func setNameLabelConstraints() {
        statLabel.translatesAutoresizingMaskIntoConstraints = false
        statLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        statLabel.trailingAnchor.constraint(equalTo: percentLabel.leadingAnchor, constant: -10).isActive = true
    }
    
}
