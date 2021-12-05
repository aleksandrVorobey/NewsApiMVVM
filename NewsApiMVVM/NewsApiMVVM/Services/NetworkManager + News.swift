//
//  NetworkManager + News.swift
//  NewsApiMVVM
//
//  Created by Александр Воробей on 24.11.2021.
//

import Foundation

extension NetworkManager: NewsNetworkProtocol {
    func requestNews(paramPage: Int, completion: @escaping (Result<NewsResponse, Error>) -> Void) {
        let url = URLFactory.url(paramPage: paramPage).absoluteString
        print("url - \(url)")
        baseRequest(url: url, completion: completion)
    }
    
}
