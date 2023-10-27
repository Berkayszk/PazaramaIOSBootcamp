//
//  View.swift
//  FoodyApp
//
//  Created by Berkay Sazak on 22.10.2023.
//

import Foundation
import UIKit

class View {
    static let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    static let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    static let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 20)
        layout.minimumLineSpacing = 15
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    static let mostPopularCollectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 10)
        layout.minimumLineSpacing = 90
        layout.itemSize = CGSize(width: 230, height: 190)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    static let mostPopularLabel: UILabel = {
       let label = UILabel()
        label.text = "Most Popular"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    static let label: UILabel = {
        let label = UILabel()
        label.text = "Welcome the Foody!!"
        label.textAlignment = .justified
        label.textColor = .black
        //label.topAnchor.constraint(equalToSystemSpacingBelow: contentView.topAnchor, multiplier: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    static let cartImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(systemName: "cart.circle")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .darkGray
        return imageView
    }()
    
    static let deliveryLabel: UILabel = {
       let label = UILabel()
        label.text = "Select Your Location"
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    static let currentLocationLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Current Location"
        label.font =  .systemFont(ofSize: 20, weight: .semibold)
        label.numberOfLines = 0
        label.textColor = .darkGray
        return label
    }()
    
    static let chevronCompactbutton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "chevron.compact.down"), for: .normal)
        button.tintColor = .systemYellow
        return button
    }()
    
    static let searchBar: UISearchBar = {
        let bar = UISearchBar()
        bar.placeholder = "Search food..."
        bar.translatesAutoresizingMaskIntoConstraints = false
        bar.sizeToFit()
        bar.layer.cornerRadius = 45
        bar.layer.masksToBounds = true
        bar.searchBarStyle = .minimal
        return bar
    }()
    
    static let popularRestaurantLabel: UILabel = {
        let label = UILabel()
        label.text = "Popular Restaurants"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    static let viewAllButton: UIButton = {
       let button = UIButton()
        button.setTitle("View all", for: .normal)
        button.tintColor = .orange
        button.configuration = .plain()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    static let tableView: UITableView = {
       let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        return tableView
    }()
    

    
    static let viewAllButton2: UIButton = {
       let button = UIButton()
        button.setTitle("View all", for: .normal)
        button.tintColor = .orange
        button.configuration = .plain()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    static let recentItemsLabel: UILabel = {
       let label = UILabel()
        label.text = "Recent Items"
        label.font = .systemFont(ofSize: 23, weight: .bold)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        return label
    }()
    
    static let viewAllButton3: UIButton = {
       let button = UIButton()
        button.setTitle("View all", for: .normal)
        button.tintColor = .orange
        button.configuration = .plain()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    static let recentRestaurants: UITableView = {
        let tableview = UITableView()
        tableview.translatesAutoresizingMaskIntoConstraints = false
        return tableview
    }()
}
