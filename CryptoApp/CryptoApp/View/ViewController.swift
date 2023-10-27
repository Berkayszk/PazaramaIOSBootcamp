//
//  ViewController.swift
//  CryptoApp
//
//  Created by Berkay Sazak on 21.10.2023.
//

import UIKit
import RxSwift

class ViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {
    
    let tableView = UITableView()
    var selectedCrypto: Crypto?
    var cryptoList = [Crypto]()
    let disposeBag = DisposeBag()
    let cryptoVM = CryptoViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupTableView()
        setupBinding()
        cryptoVM.requestData()
        tableView.delegate = self
        tableView.dataSource = self
        
        
    }
    
    private func setupBinding(){
        cryptoVM
            .cryptos
            .observe(on: MainScheduler.asyncInstance)
            .subscribe { cryptos in
                self.updateTableView(with: cryptos)
            }.disposed(by: disposeBag)
        cryptoVM
            .error
            .observe(on: MainScheduler.asyncInstance)
            .subscribe{ error in
                print(error)
                
            }.disposed(by: disposeBag)
        cryptoVM
            .loading
            .observe(on: MainScheduler.asyncInstance)
            .subscribe { bool in
                print(bool)
            }.disposed(by: disposeBag)
    }
    
    private func setupTableView(){
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo:view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo:view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo:view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo:view.bottomAnchor).isActive = true
    }
    
    func updateTableView(with newCryptoData: [Crypto]) {
        let startIndex = cryptoList.count
        cryptoList.append(contentsOf: newCryptoData)
        
        var indexPaths: [IndexPath] = []
        for row in startIndex..<cryptoList.count {
            indexPaths.append(IndexPath(row: row, section: 0))
        }
        
        tableView.beginUpdates()
        tableView.insertRows(at: indexPaths, with: .automatic)
        tableView.endUpdates()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cryptoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.cryptoName.text = cryptoList[indexPath.row].currency
        cell.cryptoPrice.text = cryptoList[indexPath.row].price
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCrypto = cryptoList[indexPath.row]
    }
    
    
        
        
}


