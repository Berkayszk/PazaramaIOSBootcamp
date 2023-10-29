//
//  DetailsViewController.swift
//  GOTApp
//
//  Created by Berkay Sazak on 29.10.2023.
//

import UIKit
class DetailsViewController: UIViewController {

    var selectedGOT : GameOfThrones?
    
    
    
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
       label.font = .systemFont(ofSize: 20)
       label.font = .boldSystemFont(ofSize: 20)
       label.translatesAutoresizingMaskIntoConstraints = false
       return label

   }()
   let lastName : UILabel = {
       let label = UILabel()
       label.text = "Test"
       label.textAlignment = .center
       label.font = .boldSystemFont(ofSize: 20)
       label.font = .systemFont(ofSize: 20)
       label.translatesAutoresizingMaskIntoConstraints = false
       return label

   }()
   let fullName : UILabel = {
       let label = UILabel()
       label.text = "Test"
       label.textAlignment = .center
       label.font = .systemFont(ofSize: 18)
       label.translatesAutoresizingMaskIntoConstraints = false
       return label

   }()
   let tittleName : UILabel = {
       let label = UILabel()
       label.text = "Test"
       label.textAlignment = .center
       label.font = .systemFont(ofSize: 18)
       label.translatesAutoresizingMaskIntoConstraints = false
       return label

   }()
   let familyName : UILabel = {
       let label = UILabel()
       label.text = "Test"
       label.textAlignment = .center
       label.font = .systemFont(ofSize: 18)
       label.translatesAutoresizingMaskIntoConstraints = false
       return label

   }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDetails()
        
        view.backgroundColor = .white
        let selectedImage = selectedGOT?.imageURL
        if let selectedImage = selectedImage {
            detailsImageView.downloaded(from: selectedImage)
        }else {
            detailsImageView.image = UIImage(systemName: "house.fill")
        }
        firstName.text = "First Name: \(selectedGOT!.firstName)"
        lastName.text =  "Last Name: \(String(describing: selectedGOT!.lastName))"
        fullName.text = "Full Name: \(String(describing: selectedGOT!.fullName))"
        tittleName.text = "Title Name: \(String(describing: selectedGOT!.title))"
        familyName.text = "Family Name: \(String(describing: selectedGOT!.family))"
        
    }
    
    func setupDetails() {
        
        view.addSubview(detailsImageView)
        view.addSubview(firstName)
        view.addSubview(lastName)
        view.addSubview(fullName)
        view.addSubview(tittleName)
        view.addSubview(familyName)
        
        NSLayoutConstraint.activate([
        
                detailsImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 130),
                detailsImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),

                detailsImageView.heightAnchor.constraint(equalToConstant: 250),
                detailsImageView.widthAnchor.constraint(equalToConstant: 250),
                
                firstName.topAnchor.constraint(equalTo: detailsImageView.bottomAnchor, constant: 40),
                firstName.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                firstName.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                
                lastName.topAnchor.constraint(equalTo: firstName.bottomAnchor, constant: 40),
                lastName.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                lastName.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                
                fullName.topAnchor.constraint(equalTo: lastName.bottomAnchor, constant: 40),
                fullName.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                fullName.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                
                tittleName.topAnchor.constraint(equalTo: fullName.bottomAnchor, constant: 40),
                tittleName.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                tittleName.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                
                familyName.topAnchor.constraint(equalTo: tittleName.bottomAnchor, constant: 40),
                familyName.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                familyName.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            

            
        
        
        ])
        
    }
    
    

}


