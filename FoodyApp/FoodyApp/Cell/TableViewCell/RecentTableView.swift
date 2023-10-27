//
//  RecentTableView.swift
//  FoodyApp
//
//  Created by Berkay Sazak on 22.10.2023.
//

import UIKit

class RecentTableViewCell: UITableViewCell {

    static let identifier = "RecentTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            setupViews()
        self.layer.cornerRadius = 10
        }
        
        required init?(coder: NSCoder) {
            super.init(coder: coder)
            setupViews()
        }
    
    private let restaurantImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(systemName: "house.fill")
        imageView.tintColor = .label
        imageView.layer.borderWidth = 1
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let restaurantLabel: UILabel = {
        let label = UILabel()
        label.text = "Testing"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let starImage: UIImageView = {
       let iv = UIImageView()
        iv.image = UIImage(systemName: "star.fill")
        iv.tintColor = .orange
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    private let averageLabel: UILabel = {
       let label = UILabel()
        label.numberOfLines = 0
        label.text = "4.9"
        label.textColor = .orange
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let infoLabel: UILabel = {
       let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Cafe Western Food"
        return label
    }()
    
    private let ratingLabel: UILabel = {
       let label = UILabel()
        label.text = "(124 ratings)"
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with image: UIImage, and name: String) {
        self.restaurantImageView.image = image
        self.restaurantLabel.text = name
    }
    
    private func setupViews() {
        contentView.addSubview(restaurantImageView)
        contentView.addSubview(starImage)
        contentView.addSubview(restaurantLabel)
        contentView.addSubview(averageLabel)
        contentView.addSubview(infoLabel)
        contentView.addSubview(ratingLabel)
        
        
        
        restaurantImageView.layer.cornerRadius = 10
        
        NSLayoutConstraint.activate([
            restaurantImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            restaurantImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            restaurantImageView.widthAnchor.constraint(equalToConstant: contentView.frame.size.width / 3),
            restaurantImageView.heightAnchor.constraint(equalToConstant: 100),
            
            restaurantLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            restaurantLabel.leadingAnchor.constraint(equalTo: restaurantImageView.trailingAnchor,constant: 30),
            
            starImage.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 10),
            starImage.leadingAnchor.constraint(equalTo: restaurantImageView.trailingAnchor, constant: 30),
            
            averageLabel.topAnchor.constraint(equalTo: infoLabel.bottomAnchor,constant: 10),
            averageLabel.leadingAnchor.constraint(equalTo: starImage.trailingAnchor, constant: 10),
            
            infoLabel.topAnchor.constraint(equalTo: restaurantLabel.bottomAnchor, constant: 10),
            infoLabel.leadingAnchor.constraint(equalTo: restaurantImageView.trailingAnchor, constant: 30),
            
            ratingLabel.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 10),
            ratingLabel.leadingAnchor.constraint(equalTo: averageLabel.trailingAnchor, constant: 10)
            
        ])
        }

}
