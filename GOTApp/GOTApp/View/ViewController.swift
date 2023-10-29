//
//  ViewController.swift
//  GOTApp
//
//  Created by Berkay Sazak on 28.10.2023.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
 
    let tableView = UITableView()
    let gotViewModel = GOTViewModel()
    let disposeBag = DisposeBag()
    
    var gotList = [GameOfThrones]()
    var selectedGOT : GameOfThrones?
    
    
    let indicatorView : UIActivityIndicatorView = {
        let indicatorView = UIActivityIndicatorView()
        
        
        
        return indicatorView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        tableView.delegate = self
        tableView.dataSource = self
        
        setupBindings()
        gotViewModel.requestData()
        setupViews()
        
        
    }
    
    private func setupBindings(){
        
        gotViewModel
            .loading
            .bind(to: self.indicatorView.rx.isAnimating)
            .disposed(by: disposeBag)
        
        
        gotViewModel
            .error
            .observe(on: MainScheduler.asyncInstance)
            .subscribe { errorString in
                print(errorString)
            }
            .disposed(by: disposeBag)
        
        

        gotViewModel
            .gots
            .observe(on: MainScheduler.asyncInstance)
            .subscribe { gots in
                print("veriler geldi")
                self.gotList = gots
                print("gotlist eşitlendi")
                self.tableView.reloadData()
                print("table view refesh oldu")
            }
            .disposed(by: disposeBag)

        
   
        }
    
    private func setupViews() {
        
        view.addSubview(tableView)
        
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: "mainCell")
        
        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])


        
    }
    
   
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gotList.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainCell", for: indexPath) as! MainTableViewCell
        cell.mainImageView.downloaded(from: gotList[indexPath.row].imageURL)
        cell.nameLabel.text = gotList[indexPath.row].fullName
        cell.titleLabel.text = gotList[indexPath.row].title
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedGOT = gotList[indexPath.row]
        
        let detailsVC = DetailsViewController()
        detailsVC.selectedGOT = selectedGOT
        
        _ = UINavigationController(rootViewController: detailsVC)
        self.navigationController?.pushViewController(detailsVC, animated: true)
        
    }

}

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}


