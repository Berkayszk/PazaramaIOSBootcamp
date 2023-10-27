//
//  CategoryCollectionViewCell.swift
//  FoodyApp
//
//  Created by Berkay Sazak on 22.10.2023.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    static let identifier = "CategoryCollectionViewCell"
    private let categoryImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(systemName: "house.fill")
        imageView.tintColor = .black
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Test text"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    func configure(with image: UIImage, and title: String) {
        self.categoryImage.image = image
        self.categoryLabel.text = title
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
        contentView.addSubview(categoryImage)
        contentView.addSubview(categoryLabel)
        self.layer.cornerRadius = 10
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            categoryImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            categoryImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            categoryImage.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            categoryImage.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.80),
            
            categoryLabel.topAnchor.constraint(equalTo: categoryImage.bottomAnchor, constant: 5),
            categoryLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            categoryLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            categoryLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

