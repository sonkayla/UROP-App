//
//  FavoritesViewController.swift
//  Virtual Try-on SIm
//
//  Created by Khoa Vu on 3/3/24.
//

import UIKit

class FavoritesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITabBarDelegate {
    
    var collectionView: UICollectionView!
    
    let favTabBar = UITabBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Favorites"
        setupCollectionView()
        setupFavTabBar()
        
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (view.frame.size.width/2) - 4, height: (view.frame.size.width/2) - 4)
        layout.minimumLineSpacing = 4
        layout.minimumInteritemSpacing = 4
        layout.headerReferenceSize = CGSize(width: view.frame.size.width, height: 50)
        
        let padding: CGFloat = 20.0
        layout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: 0, right: padding)
        
        layout.itemSize = CGSize(width: 174, height: 174)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(FavoriteCollectionViewCell.self, forCellWithReuseIdentifier: "FavoriteCell")
        collectionView.register(FavoritesHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "FavoritesHeader")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    private func setupFavTabBar() {
        view.addSubview(favTabBar)
        
        favTabBar.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            favTabBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            favTabBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            favTabBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            favTabBar.heightAnchor.constraint(equalToConstant: 49)
        ])
        
        let homeItem = UITabBarItem(title: "Home", image: UIImage(named: "homeIcon"), tag: 0)
        let favoriteItem = UITabBarItem(title: "Favorites", image: UIImage(named: "favoriteIcon"), tag: 1)
        let profileItem = UITabBarItem(title: "Profile", image: UIImage(named: "profileIcon"), tag: 2)
        
        favTabBar.items = [homeItem, favoriteItem, profileItem]
        
        favTabBar.tintColor = .systemBlue
        favTabBar.unselectedItemTintColor = .gray
        favTabBar.itemPositioning = .automatic
        favTabBar.delegate = self
    }
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item.tag == 0 {
            let viewController = ViewController()
                viewController.modalPresentationStyle = .overFullScreen
                self.present(viewController, animated: true, completion: nil)
        }
    }
        
    // MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // Return the number of items you want to display
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoriteCell", for: indexPath) as! FavoriteCollectionViewCell
        // Configure the cell
        return cell
    }
    
    // MARK: - UICollectionViewDelegate
    // Implement any delegate methods you need, like didSelectItemAt
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader else {
            return UICollectionReusableView()
        }
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "FavoritesHeader", for: indexPath) as! FavoritesHeaderView
        return header
    }

}

class FavoriteCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        backgroundColor = .lightGray
    }
}

class FavoritesHeaderView: UICollectionReusableView {
    private let titleLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        titleLabel.text = "Favorites"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 30)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)

        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
