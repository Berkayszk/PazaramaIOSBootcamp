//
//  ViewController.swift
//  ProtocolOrientedUIKit
//
//  Created by Berkay Sazak on 1.11.2023.
//

import UIKit

class ViewController: UIViewController, UserViewModelOutput {
    func updateView(name: String, email: String, userName: String) {
        self.nameLabel.text = name
        self.usernameLabel.text = userName
        self.emailLabel.text = email
    }
    
    
    private let userViewModel : UserViewModel
    
    private let nameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    private let usernameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    private let emailLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userViewModel.fetchUser()
        setupView()
    }
    
    init(userViewModel: UserViewModel) {
        self.userViewModel = userViewModel
        super.init(nibName: nil, bundle: nil)
        self.userViewModel.output = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        view.backgroundColor = .white
            
            view.addSubview(emailLabel)
              view.addSubview(nameLabel)
              view.addSubview(usernameLabel)
            
            NSLayoutConstraint.activate([
              nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
              nameLabel.heightAnchor.constraint(equalToConstant: 60),
              nameLabel.widthAnchor.constraint(equalToConstant: 200),
              nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
              
              emailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
              emailLabel.heightAnchor.constraint(equalToConstant: 60),
              emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
              
              usernameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
              usernameLabel.heightAnchor.constraint(equalToConstant: 60),
              usernameLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10)

              
            ])
        
    }

}

