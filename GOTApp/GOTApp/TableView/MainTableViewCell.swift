//
//  MainTableViewCell.swift
//  GOTApp
//
//  Created by Berkay Sazak on 28.10.2023.
//

import UIKit

class MainTableViewCell: UITableViewCell {

  
    
    
     let mainImageView : UIImageView = {
         let imageView = UIImageView()
         imageView.contentMode = .scaleAspectFit
         imageView.translatesAutoresizingMaskIntoConstraints = false
         imageView.layer.cornerRadius = 30
         imageView.layer.masksToBounds = true
         imageView.layer.borderWidth = 0
         imageView.layer.borderColor = UIColor.black.cgColor
         return imageView
    }()
     
     
    
     let nameLabel : UILabel = {
         let nameLabel = UILabel()
         nameLabel.text = "Test Text"
         nameLabel.textColor = .black
         nameLabel.font = .boldSystemFont(ofSize: 20)
         nameLabel.textAlignment = .center
         nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    
    let titleLabel : UILabel = {
        let title = UILabel()
        title.text = "Test "
        title.textColor = .black
        title.font = .systemFont(ofSize: 13)
        title.textAlignment = .center
        title.translatesAutoresizingMaskIntoConstraints = false
       return title
   }()
        
    func addViews() {
        
        //addSubview(mainImageView)
        addSubview(nameLabel)
        addSubview(titleLabel)
        addSubview(mainImageView)
        
        
        NSLayoutConstraint.activate([
       
            
        mainImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
        mainImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
        mainImageView.heightAnchor.constraint(equalToConstant: 105),
        mainImageView.widthAnchor.constraint(equalToConstant: 150),
        
      
        nameLabel.leadingAnchor.constraint(equalTo: mainImageView.trailingAnchor, constant: 50),
        nameLabel.topAnchor.constraint(equalTo: mainImageView.topAnchor, constant: 30),

        
       
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor),
        titleLabel.leftAnchor.constraint(equalTo: mainImageView.leftAnchor, constant: 140),
        titleLabel.topAnchor.constraint(equalTo: nameLabel.topAnchor, constant: 45),
        titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor)

    ])
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
