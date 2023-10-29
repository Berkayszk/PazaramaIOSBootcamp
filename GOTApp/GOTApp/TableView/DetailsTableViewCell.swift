//
//  DetailsTableViewCell.swift
//  GOTApp
//
//  Created by Berkay Sazak on 29.10.2023.
//

import UIKit

class DetailsTableViewCell: UITableViewCell {

    
    
     let detailsImageView : UIImageView = {
         let imageView = UIImageView()
         imageView.contentMode = .scaleAspectFit
         imageView.translatesAutoresizingMaskIntoConstraints = false
         imageView.layer.cornerRadius = 30
         imageView.layer.masksToBounds = true
         imageView.layer.borderWidth = 0
         imageView.layer.borderColor = UIColor.black.cgColor
         return imageView
    }()
    
    let firstName : UILabel = {
        let label = UILabel()
        label.text = "Test"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label

    }()
    let lastName : UILabel = {
        let label = UILabel()
        label.text = "Test"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label

    }()
    let fullName : UILabel = {
        let label = UILabel()
        label.text = "Test"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label

    }()
    let tittleName : UILabel = {
        let label = UILabel()
        label.text = "Test"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label

    }()
    let familyName : UILabel = {
        let label = UILabel()
        label.text = "Test"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label

    }()
    
    func addViews(){
        
        addSubview(detailsImageView)
        addSubview(firstName)
        addSubview(lastName)
        addSubview(fullName)
        addSubview(tittleName)
        addSubview(familyName)
        
        
        NSLayoutConstraint.activate([
        
            detailsImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            detailsImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            detailsImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            detailsImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            firstName.topAnchor.constraint(equalTo: detailsImageView.bottomAnchor, constant: 40),
            firstName.leadingAnchor.constraint(equalTo: leftAnchor),
            firstName.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            lastName.topAnchor.constraint(equalTo: lastName.bottomAnchor, constant: 40),
            lastName.leadingAnchor.constraint(equalTo: leftAnchor),
            lastName.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            fullName.topAnchor.constraint(equalTo: fullName.bottomAnchor, constant: 40),
            fullName.leadingAnchor.constraint(equalTo: leftAnchor),
            fullName.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            tittleName.topAnchor.constraint(equalTo: tittleName.bottomAnchor, constant: 40),
            tittleName.leadingAnchor.constraint(equalTo: leftAnchor),
            tittleName.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            familyName.topAnchor.constraint(equalTo: familyName.bottomAnchor, constant: 40),
            familyName.leadingAnchor.constraint(equalTo: leftAnchor),
            familyName.trailingAnchor.constraint(equalTo: trailingAnchor),
            

            
        
        
        ])
        
        
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
