//
//  ViewController.swift
//  Virtual Try-on SIm
//
//  Created by Kayla Son on 2/17/24.
//

import UIKit

class ViewController: UIViewController, UITabBarDelegate {
    
    // UI Components
    let tryOnImageView = UIImageView()
    let analysisLabel = UILabel()
    let sizeSegmentControl = UISegmentedControl(items: ["Small", "Medium", "Large", "XLarge"])
    let fitAnalysisLabel = UILabel()
    let tabBar = UITabBar()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationItem.title = "More Clothing Detail"
        setupUI()
        setupTabBar()
        sizeChanged(sizeSegmentControl)
    }
    
    private func setupUI() {
        tryOnImageView.contentMode = .scaleAspectFit
        tryOnImageView.backgroundColor = .lightGray
        tryOnImageView.translatesAutoresizingMaskIntoConstraints = false
        
        fitAnalysisLabel.textAlignment = .center
        fitAnalysisLabel.layer.borderWidth = 1.0
        fitAnalysisLabel.layer.borderColor = UIColor.black.cgColor
        fitAnalysisLabel.translatesAutoresizingMaskIntoConstraints = false
        
        analysisLabel.font = UIFont.boldSystemFont(ofSize: 24)
        analysisLabel.textAlignment = .left
        analysisLabel.text = "Sizes:"
        analysisLabel.translatesAutoresizingMaskIntoConstraints = false
        
        sizeSegmentControl.addTarget(self, action: #selector(sizeChanged(_:)), for: .valueChanged)
        sizeSegmentControl.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(tryOnImageView)
        view.addSubview(fitAnalysisLabel)
        view.addSubview(analysisLabel)
        view.addSubview(sizeSegmentControl)
        
        NSLayoutConstraint.activate([
            tryOnImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            tryOnImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            tryOnImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            tryOnImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5)
        ])
        
        NSLayoutConstraint.activate([
            fitAnalysisLabel.topAnchor.constraint(equalTo: tryOnImageView.bottomAnchor, constant: 20),
            fitAnalysisLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            fitAnalysisLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            fitAnalysisLabel.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        NSLayoutConstraint.activate([
            analysisLabel.topAnchor.constraint(equalTo: fitAnalysisLabel.bottomAnchor, constant: 20),
            analysisLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            analysisLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    
        NSLayoutConstraint.activate([
            sizeSegmentControl.topAnchor.constraint(equalTo: analysisLabel.bottomAnchor, constant: 20),
            sizeSegmentControl.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            sizeSegmentControl.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
    
    @objc private func sizeChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
               case 0:
                   fitAnalysisLabel.text = "Tighter Fit"
               case 1:
                   fitAnalysisLabel.text = "Perfect Fit"
               case 2:
                   fitAnalysisLabel.text = "Looser Fit"
               case 3:
                   fitAnalysisLabel.text = "Very Loose Fit"
               default:
                   fitAnalysisLabel.text = "Select a size"
        }
    }
    
    private func setupTabBar() {
        view.addSubview(tabBar)
        
        tabBar.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tabBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tabBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tabBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tabBar.heightAnchor.constraint(equalToConstant: 49)
        ])
        
        let homeItem = UITabBarItem(title: "Home", image: UIImage(named: "homeIcon"), tag: 0)
        let favoriteItem = UITabBarItem(title: "Favorites", image: UIImage(named: "favoriteIcon"), tag: 1)
        let profileItem = UITabBarItem(title: "Profile", image: UIImage(named: "profileIcon"), tag: 2)
        
        tabBar.items = [homeItem, favoriteItem, profileItem]
        
        tabBar.tintColor = .systemBlue
        tabBar.unselectedItemTintColor = .gray
        tabBar.itemPositioning = .automatic
        tabBar.delegate = self
    }
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item.tag == 1 {
            let favoritesViewController = FavoritesViewController()
                favoritesViewController.modalPresentationStyle = .overFullScreen
                self.present(favoritesViewController, animated: true, completion: nil)
        }
    }



}
