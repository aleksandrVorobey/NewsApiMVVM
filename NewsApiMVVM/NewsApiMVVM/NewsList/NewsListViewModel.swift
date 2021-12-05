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
    var currentPage: Int { get }
    var isFetchInProgress: Bool { get }
    func getNews(completion: @escaping () -> Void)
    func numberOfRows() -> Int
    func cellViewModel(at indexPath: IndexPath) -> NewsCellViewModelProtocol
}

class NewsListViewModel: NewsListViewModelProtocol {
        
    let network: NewsNetworkProtocol = NetworkManager()
        
    var news = [Article]()
    
    var currentPage = 1
    var isFetchInProgress = false
    
    func getNews(completion: @escaping () -> Void) {
        guard !isFetchInProgress else { return }
        isFetchInProgress = true

        network.requestNews(paramPage: currentPage) { result in
            switch result {
            case .failure(let error):
                print(error)
                self.isFetchInProgress = false
            case .success(let newsResponse):
                self.news += newsResponse.articles ?? []
                print(self.news.count)
                self.currentPage += 1
                self.isFetchInProgress = false
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
