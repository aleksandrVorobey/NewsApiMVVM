//
//  URLFactory.swift
//  NewsApiMVVM
//
//  Created by Александр Воробей on 24.11.2021.
//

import Foundation

struct URLFactory {
    
    static let apiKey = "18e1522100154cbdb37e68e3e718761c"

    static let baseURLComponents: URLComponents = {
        let url = URL(string: "https://newsapi.org/v2/")!
        let queryItem = [URLQueryItem(name: "q", value: "ios"),
                         URLQueryItem(name: "apiKey", value: "\(apiKey)")]
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)!
        urlComponents.queryItems = queryItem
        return urlComponents
    }()
    
    static func articles() -> String {
        let urlComponents = baseURLComponents
        return urlComponents.url!.appendingPathComponent("everything").absoluteString
    }
    
    static func url() -> URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "newsapi.org"
        components.path = "/v2/everything"
        components.queryItems = [URLQueryItem(name: "q", value: "беларусь"),
                                 URLQueryItem(name: "pageSize", value: "1"),
                                 URLQueryItem(name: "page", value: "1"),
                                 URLQueryItem(name: "apiKey", value: "\(apiKey)")]
        return components.url!
    }
}
