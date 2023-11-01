//
//  TableViewCell.swift
//  SpaceFlightNews
//
//  Created by Berkay Sazak on 30.10.2023.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    
    let newsImage : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "wifi.circle")
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 0
        imageView.layer.borderColor = UIColor.black.cgColor
        return imageView
   }()
    
    let titleText : UILabel = {
        let label = UILabel()
        label.text = "Test Title"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 10)
        label.font = .boldSystemFont(ofSize: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label

    }()
    let newsSiteText : UILabel = {
        let label = UILabel()
        label.text = "Test News Text"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 20)
        label.font = .boldSystemFont(ofSize: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label

    }()
    
    let summaryText : UILabel = {
        let label = UILabel()
        label.text = "Test Summary"
        label.textAlignment = .center
        label.contentMode = .scaleAspectFit
        label.font = .boldSystemFont(ofSize: 20)
        label.font = .systemFont(ofSize: 10)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label

    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addView()
    }
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    func addView(){
        
        addSubview(newsImage)
        addSubview(titleText)
        addSubview(newsSiteText)
        addSubview(summaryText)
        
        NSLayoutConstraint.activate([
                
                newsImage.topAnchor.constraint(equalTo: topAnchor),
                newsImage.centerXAnchor.constraint(equalTo: centerXAnchor),
                newsImage.widthAnchor.constraint(equalToConstant: 400),
                newsImage.heightAnchor.constraint(equalToConstant: 250),

            
                titleText.topAnchor.constraint(equalTo: newsImage.bottomAnchor, constant: 8),
                titleText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),

             
                newsSiteText.topAnchor.constraint(equalTo: titleText.bottomAnchor, constant: 8),
                newsSiteText.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20),

           
                summaryText.topAnchor.constraint(equalTo: newsSiteText.bottomAnchor, constant: 15),
                summaryText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20), // İstenirse sağ taraftan da sınırlama ekleyebilirsiniz
                summaryText.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -20)
                    
            ])
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
