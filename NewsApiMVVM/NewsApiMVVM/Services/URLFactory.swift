//
//  URLFactory.swift
//  NewsApiMVVM
//
//  Created by Александр Воробей on 24.11.2021.
//

import Foundation

struct Params {
    let pageSize: Int
    let page: Int
    let search: String
}

struct URLFactory {
    
    //static let apiKey = "18e1522100154cbdb37e68e3e718761c"
    static let apiKey = "7ba646457e7a40b29f317b2e43b5081f"

    static func url(paramPage: Int) -> URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "newsapi.org"
        components.path = "/v2/everything"
        components.queryItems = [URLQueryItem(name: "q", value: "apple"),
                                 URLQueryItem(name: "pageSize", value: "10"),
                                 URLQueryItem(name: "page", value: "\(paramPage)"),
                                 URLQueryItem(name: "apiKey", value: "\(apiKey)")]
        return components.url!
    }
}
