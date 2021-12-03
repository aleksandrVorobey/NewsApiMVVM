//
//  NewsViewModel.swift
//  NewsApiMVVM
//
//  Created by Александр Воробей on 24.11.2021.
//

import Foundation

protocol NewsListViewModelProtocol {
    var news: [Article] { get }
    var network: NewsNetworkProtocol { get }
    func getNews(completion: @escaping () -> Void)
    func numberOfRows() -> Int
    func cellViewModel(at indexPath: IndexPath) -> NewsCellViewModelProtocol
}

class NewsListViewModel: NewsListViewModelProtocol {
        
    let network: NewsNetworkProtocol = NetworkManager()
        
    var news = [Article]()
    
    func getNews(completion: @escaping () -> Void) {
        network.requestNews { result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let newsResponse):
                self.news = newsResponse.articles ?? []
                print(self.news.count)
                completion()
            }
        }
    }
    
    func numberOfRows() -> Int {
        return news.count
    }
    
    func cellViewModel(at indexPath: IndexPath) -> NewsCellViewModelProtocol {
        let news = news[indexPath.row]
        return NewsCellViewModel(news: news)
    }
    
}
