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
    init(news: News)
}

class NewsCellViewModel: NewsCellViewModelProtocol {
    
    private let news: News
    
    var newsName: String {
        news.source?.name ?? ""
    }
    
    var newsTitle: String {
        news.title ?? ""
    }
    
    var newsDescription: String {
        news.description ?? ""
    }
    
    required init(news: News) {
        self.news = news
    }
    
    
}
