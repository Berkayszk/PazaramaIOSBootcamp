//
//  NewsViewModel.swift
//  SpaceFlightNews
//
//  Created by Berkay Sazak on 1.11.2023.
//

import Foundation
import RxSwift
import RxCocoa

class NewsViewModel {
    
    let news : PublishSubject<[News]> = PublishSubject()
    let error : PublishSubject<String> = PublishSubject()
  
    
    
    func requestData() {
        
        let url = URL(string: "https://api.spaceflightnewsapi.net/v3/articles")!
        
        WebService().fetchNews(url: url) { result in
            switch result {
            case .success(let news):
                self.news.onNext(news)
                
            case .failure(let error):
                switch error {
                case .parsingError:
                    self.error.onNext("Parsing Error!")
                case .serverError:
                    self.error.onNext("Server Error!")
               
                
                }
                
                
            }
        }
        
    }
    
    
}
