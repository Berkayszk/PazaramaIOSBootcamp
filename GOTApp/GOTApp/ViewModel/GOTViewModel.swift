//
//  GOTViewModel.swift
//  GOTApp
//
//  Created by Berkay Sazak on 28.10.2023.
//

import Foundation
import RxSwift
import RxCocoa

class GOTViewModel {
    
    let gots : PublishSubject<[GameOfThrones]> = PublishSubject()
    let error : PublishSubject<String> = PublishSubject()
    let loading : PublishSubject<Bool> = PublishSubject()
    
    func requestData() {
        self.loading.onNext(true)
        
        let url = URL(string: "https://thronesapi.com/api/v2/Characters")!
        WebService().fetchGOT(url: url) { result in
            self.loading.onNext(false)
            switch result {
            case .success(let gots):
                self.gots.onNext(gots)
            case .failure(let error):
                switch error {
                case .parsingError:
                    self.error.onNext("Parsing Error")
                case .serverError:
                    self.error.onNext("Server Error")
                }
                
            }
        }
        
    }
    
    
    

    
    
}
