//
//  ViewController.swift
//  ProtocolOrientedProject
//
//  Created by Berkay Sazak on 28.10.2023.
//

import UIKit

class ViewController: UIViewController, UserViewModelOutput {
    
    func updateView(name: String, username: String, email: String) {
        
        self.userNameLabel.text = username
        self.nameLabel.text = name
        self.emailLabel.text = email
    }
    

    private let viewModel : UserViewModel
    
    
    private let nameLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let userNameLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let emailLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init(viewModel: UserViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.deleget = self
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .yellow
        
        nameLabel.text = "test name"
        userNameLabel.text = "test"
        emailLabel.text = "email test mail"
        
        setupViews()
        self.viewModel.fetchUsers()
        
        
    }
    
    
    private func setupViews(){
        
        view.backgroundColor = .yellow
        
        view.addSubview(nameLabel)
        view.addSubview(userNameLabel)
        view.addSubview(emailLabel)
        
        NSLayoutConstraint.activate([
        
            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 70),
            nameLabel.widthAnchor.constraint(equalToConstant: 200),
            
            userNameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 50),
            userNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userNameLabel.heightAnchor.constraint(equalToConstant: 70),
            userNameLabel.widthAnchor.constraint(equalToConstant: 200),
            
            emailLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 50),
            emailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailLabel.heightAnchor.constraint(equalToConstant: 70),
            emailLabel.widthAnchor.constraint(equalToConstant: 200)
            
        
        ]
        )
        
    }
    
   


}

