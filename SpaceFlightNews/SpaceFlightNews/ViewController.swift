//
//  ViewController.swift
//  SpaceFlightNews
//
//  Created by Berkay Sazak on 30.10.2023.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {


    let newsViewModel = NewsViewModel()
    let disposeBag = DisposeBag()
    var newsList = [News]()
  
    
    private let tableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        setupViews()
        
        newsViewModel.requestData()
        setupBinding()
        
        
        
    }
    
    
    func setupViews(){
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "mainCell")
        
        NSLayoutConstraint.activate([
        
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        
        
        ])
        
        
    }
    
    func setupBinding() {
        newsViewModel
            .news
            .observe(on: MainScheduler.asyncInstance)
            .subscribe{ news in
                self.newsList = news
                self.tableView.reloadData()
            }
            .disposed(by: disposeBag)
        
        newsViewModel
            .error
            .observe(on: MainScheduler.asyncInstance)
            .subscribe{ errorString in
                
                print(errorString)
                
            }
            .disposed(by: disposeBag)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainCell", for: indexPath) as! TableViewCell
        cell.newsSiteText.text = newsList[indexPath.row].newsSite
        cell.summaryText.text = newsList[indexPath.row].summary
        cell.titleText.text = newsList[indexPath.row].title
        cell.newsImage.downloaded(from: newsList[indexPath.row].imageURL)
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
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

