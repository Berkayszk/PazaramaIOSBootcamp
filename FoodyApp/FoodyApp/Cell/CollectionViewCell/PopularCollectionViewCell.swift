//
//  PopularCollectionViewCell.swift
//  FoodyApp
//
//  Created by Berkay Sazak on 22.10.2023.
//

import UIKit

class PopularCollectionViewCell: UICollectionViewCell {
    static let identifier = "PopularCollectionViewCell"
    
    private let restaurantImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(systemName: "house.fill")
        imageView.tintColor = .white
        imageView.clipsToBounds = true
        //imageView.layer.masksToBounds = true
        //imageView.layer.borderColor = .none
        imageView.layer.cornerRadius = 20
        imageView.layer.borderWidth = 1
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let restaurantLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Test text"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let infoLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Cafe Western Food"
        label.textAlignment = .center
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let starImage: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(systemName: "star.fill")
        imageView.tintColor = .orange
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let averageLabel: UILabel = {
       let label = UILabel()
        label.numberOfLines = 0
        label.text = "4.9"
        label.textColor = .orange
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func configure(with image: UIImage, and title: String) {
        self.restaurantImage.image = image
        self.restaurantLabel.text = title
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        contentView.subviews.forEach { $0.removeFromSuperview() }
        contentView.addSubview(restaurantImage)
        contentView.addSubview(restaurantLabel)
        contentView.addSubview(infoLabel)
        contentView.addSubview(starImage)
        contentView.addSubview(averageLabel)
        self.layer.cornerRadius = 10
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            restaurantImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            restaurantImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            restaurantImage.widthAnchor.constraint(equalToConstant: 200),
            restaurantImage.heightAnchor.constraint(equalToConstant: 100),
            
            restaurantLabel.topAnchor.constraint(equalTo: restaurantImage.bottomAnchor, constant: 5),
            restaurantLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            restaurantLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            infoLabel.topAnchor.constraint(equalTo: restaurantLabel.bottomAnchor, constant: 10),
            infoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 23
                                              ),
            infoLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        
            
            starImage.topAnchor.constraint(equalTo: restaurantLabel.bottomAnchor, constant: 10),
            starImage.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -130),
            
            
            averageLabel.topAnchor.constraint(equalTo: restaurantLabel.bottomAnchor, constant: 10),
            averageLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -105)
        ])
    }
}

