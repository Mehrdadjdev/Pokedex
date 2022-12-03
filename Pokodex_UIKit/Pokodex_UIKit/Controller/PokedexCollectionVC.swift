//
//  PokedexCollectionVC.swift
//  Pokodex_UIKit
//
//  Created by MehrDad on 03.12.2022.
//

import UIKit

class PokedexCollectionVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    //MARK: - Properties
    var collectionView: UICollectionView?
    
    //MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Favorites"
        configureCollectionView()
    }
    
    //MARK: - Configure Collection View
    func configureCollectionView() {
        let widthSize = view.frame.size.width
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        layout.itemSize = CGSize(width: (widthSize / 3) - 20, height: (widthSize / 3) - 20)
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        guard let collectionView = collectionView  else { return }
        
        collectionView.register(FavoriteCell.self, forCellWithReuseIdentifier: FavoriteCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.contentInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        view.addSubview(collectionView)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FavoriteCell.identifier, for: indexPath) as! FavoriteCell
        
        return cell
    }
}
