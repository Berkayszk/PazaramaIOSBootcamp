//
//  ViewController.swift
//  FoodyApp
//
//  Created by Berkay Sazak on 21.10.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var category: [Category] = []
    var restaurants: [Foods] = []
    var popularRestaurants: [Foods] = []
    let scrollView = View.scrollView
    let contentView = View.contentView
    let collectionView = View.collectionView
    let label = View.label
    let cartImage = View.cartImage
    let searchBar = View.searchBar
    let currentLocationLabel = View.currentLocationLabel
    let chevronCompactbutton = View.chevronCompactbutton
    let deliveryLabel = View.deliveryLabel
    let popularRestaurantLabel = View.popularRestaurantLabel
    let viewAllButton = View.viewAllButton
    let tableView = View.tableView
    let mostPopularCollectionView = View.mostPopularCollectionView
    let mostPopularLabel = View.mostPopularLabel
    let viewAll = View.viewAllButton2
    let recentItems = View.recentItemsLabel
    let viewButton = View.viewAllButton3
    let recentTableView = View.recentRestaurants
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        setup()
        tableView.separatorStyle = .none
        recentTableView.separatorStyle = .none
        
        
        let category1 = Category(image: UIImage(named: "burger")!, name: "Hamburgers")
        let category2 = Category(image: UIImage(named: "cakes")!, name: "Cakes")
        let category3 = Category(image: UIImage(named: "beans")!, name: "Caffee")
        category.append(category1)
        category.append(category2)
        category.append(category3)
        
        let popFood = Foods(image: UIImage(named: "doner")!, name: "Doner Kebab House")
        let popFood2 = Foods(image: UIImage(named: "cafe")!, name: "Istanbul Cafe")
        let popFood3 = Foods(image: UIImage(named: "baklava")!, name: "Osmanli Baklava")
        restaurants.append(popFood)
        restaurants.append(popFood2)
        restaurants.append(popFood3)
        
        let popFood4 = Foods(image: UIImage(named: "baklava")!, name: "Osmanli Baklava")
        let popFood5 = Foods(image: UIImage(named: "meals")!, name: "Big Et-House")
        let popFood6 = Foods(image: UIImage(named: "soups")!, name: "Soup Cafe")
        popularRestaurants.append(popFood4)
        popularRestaurants.append(popFood5)
        popularRestaurants.append(popFood6)
        
    }
    
    private func setup() {
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(collectionView)
        contentView.addSubview(label)
        contentView.addSubview(cartImage)
        contentView.addSubview(deliveryLabel)
        contentView.addSubview(currentLocationLabel)
        contentView.addSubview(chevronCompactbutton)
        contentView.addSubview(searchBar)
        contentView.addSubview(popularRestaurantLabel)
        contentView.addSubview(viewAllButton)
        contentView.addSubview(tableView)
        contentView.addSubview(mostPopularCollectionView)
        contentView.addSubview(mostPopularLabel)
        contentView.addSubview(viewAll)
        contentView.addSubview(recentItems)
        contentView.addSubview(viewButton)
        contentView.addSubview(recentTableView)
        
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PopularRestaurantCell.self, forCellReuseIdentifier: PopularRestaurantCell.identifier)

        
        recentTableView.delegate = self
        recentTableView.dataSource = self
        recentTableView.register(RecentTableViewCell.self, forCellReuseIdentifier: RecentTableViewCell.identifier)
        
        mostPopularCollectionView.delegate = self
        mostPopularCollectionView.dataSource = self
        mostPopularCollectionView.register(PopularCollectionViewCell.self, forCellWithReuseIdentifier: PopularCollectionViewCell.identifier)
        
        collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        
        let hConst = contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        hConst.isActive = true
        hConst.priority = UILayoutPriority(50)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")

        NSLayoutConstraint.activate([
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            scrollView.heightAnchor.constraint(equalToConstant: view.frame.size.height),
            scrollView.widthAnchor.constraint(equalToConstant: view.frame.size.width),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            label.heightAnchor.constraint(equalToConstant: 30),
            label.widthAnchor.constraint(equalToConstant: 250),

            cartImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            cartImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            cartImage.centerYAnchor.constraint(equalTo: label.centerYAnchor),
            cartImage.heightAnchor.constraint(equalToConstant: 25),
            cartImage.widthAnchor.constraint(equalToConstant: 25),

            deliveryLabel.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 30),
            deliveryLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),

            currentLocationLabel.topAnchor.constraint(equalTo: deliveryLabel.bottomAnchor, constant: 10),
            currentLocationLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),

            chevronCompactbutton.topAnchor.constraint(equalTo: deliveryLabel
                .bottomAnchor, constant: 10),
            chevronCompactbutton.leadingAnchor.constraint(equalTo: currentLocationLabel.trailingAnchor, constant: 20),

            searchBar.topAnchor.constraint(equalTo: currentLocationLabel.bottomAnchor, constant: 10),
            searchBar.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            searchBar.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),

            collectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 20),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 140),

            popularRestaurantLabel.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 40),
            popularRestaurantLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),

            viewAllButton.leadingAnchor.constraint(equalTo: popularRestaurantLabel.trailingAnchor, constant: 90),
            viewAllButton.topAnchor.constraint(equalTo: popularRestaurantLabel.bottomAnchor, constant: 45),

            tableView.topAnchor.constraint(equalTo: popularRestaurantLabel.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            tableView.heightAnchor.constraint(equalToConstant: 800),
            
            mostPopularLabel.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 10),
            mostPopularLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            mostPopularLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            viewAll.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 10),
            viewAll.leadingAnchor.constraint(equalTo: mostPopularLabel.trailingAnchor, constant: 90),
            viewAll.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -95),
            

            mostPopularCollectionView.topAnchor.constraint(equalTo: mostPopularLabel.bottomAnchor, constant: 10),
            mostPopularCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mostPopularCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            mostPopularCollectionView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            mostPopularCollectionView.heightAnchor.constraint(equalToConstant: 190),
            
            recentItems.topAnchor.constraint(equalTo: mostPopularCollectionView.bottomAnchor, constant: 30),
            recentItems.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            viewButton.topAnchor.constraint(equalTo: mostPopularCollectionView.bottomAnchor, constant: 30),
            viewButton.leadingAnchor.constraint(equalTo: recentItems.trailingAnchor, constant: 120),
            
            recentTableView.topAnchor.constraint(equalTo: recentItems.bottomAnchor,constant: 10),
            recentTableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            recentTableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            recentTableView.heightAnchor.constraint(equalToConstant: 400),
            
            recentTableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
}

