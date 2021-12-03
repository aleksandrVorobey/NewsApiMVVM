//
//  NewsCellViewModel.swift
//  NewsApiMVVM
//
//  Created by Александр Воробей on 24.11.2021.
//

import Foundation

protocol NewsCellViewModelProtocol: AnyObject {
    var newsName: String { get }
    var newsTitle: String { get }
    var newsDescription: String { get }
    var urlToImage: String { get }
    init(news: Article)
}

class NewsCellViewModel: NewsCellViewModelProtocol {
    
    private let news: Article
    
    var newsName: String {
        news.source?.name ?? "Unknown"
    }
    
    var newsTitle: String {
        news.title ?? "Unknown"
    }
    
    var newsDescription: String {
        news.description ?? "Unknown"
    }
    
    var urlToImage: String {
        news.urlToImage ?? "https://cdn.pixabay.com/photo/2016/06/02/16/16/newspaper-1431401_960_720.png"
    }
    
    required init(news: Article) {
        self.news = news
    }
    
    
}
