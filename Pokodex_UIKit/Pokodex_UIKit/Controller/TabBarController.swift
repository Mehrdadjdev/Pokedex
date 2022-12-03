//
//  TabBarController.swift
//  Pokodex_UIKit
//
//  Created by MehrDad on 03.12.2022.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .systemBlue
        setupVCs()
    }
    
    func setupVCs() {
        
        viewControllers = [
            createNavController(for: PokedexListVC(), title: "Pokedex", image: UIImage(systemName: "house.fill")!),
            createNavController(for: PokedexCollectionVC(), title: "Favorites", image: UIImage(systemName: "heart.fill")!)
            
        ]
    }
    
    fileprivate func createNavController(for rootViewController: UIViewController,
                                         title: String,
                                         image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = title
        return navController
    }
}
