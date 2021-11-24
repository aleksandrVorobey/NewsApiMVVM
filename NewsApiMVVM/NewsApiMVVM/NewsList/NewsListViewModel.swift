//
//  NewsViewModel.swift
//  NewsApiMVVM
//
//  Created by Александр Воробей on 24.11.2021.
//

import Foundation

protocol NewsListViewModelProtocol {
    var news: [News] { get }
    func getNews(completion: @escaping () -> Void)
    var network: NewsNetworkProtocol { get }
    func numberOfRows() -> Int
    func cellViewModel(at indexPath: IndexPath) -> NewsCellViewModelProtocol
}

class NewsListViewModel: NewsListViewModelProtocol {
        
    let network: NewsNetworkProtocol = NetworkManager()
        
    var news = [News]()
    
    func getNews(completion: @escaping () -> Void) {
        network.requestNews { result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let newsResponse):
                newsResponse.articles?.forEach({ news in
                    self.news.append(news)
                    print(self.news.count)
                    completion()
                })
            }
        }
    }
    
    func numberOfRows() -> Int {
        news.count
    }
    
    func cellViewModel(at indexPath: IndexPath) -> NewsCellViewModelProtocol {
        let news = news[indexPath.row]
        return NewsCellViewModel(news: news)
    }
    
}
