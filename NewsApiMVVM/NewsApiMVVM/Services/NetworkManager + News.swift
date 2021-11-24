//
//  NetworkManager + News.swift
//  NewsApiMVVM
//
//  Created by Александр Воробей on 24.11.2021.
//

import Foundation

extension NetworkManager: NewsNetworkProtocol {
    func requestNews(completion: @escaping (Result<NewsResponse, Error>) -> Void) {
        let url = URLFactory.baseURLString + URLFactory.usTopHeadline + URLFactory.apiKey
        baseRequest(url: url, completion: completion)
    }
    
}
