//
//  NewsResponse.swift
//  NewsApiMVVM
//
//  Created by Александр Воробей on 24.11.2021.
//

import Foundation



// MARK: - NewsResponse
struct NewsResponse: Decodable {
    let status: String?
    let totalResults: Int?
    let articles: [News]?
}

// MARK: - News
struct News: Decodable {
    let source: Source?
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?

//    enum CodingKeys: String, CodingKey {
//        case author, title, source
//        case articleDescription = "description"
//        case url, urlToImage, content, publishedAt
//    }
}

// MARK: - Source
struct Source: Decodable {
    let id: String?
    let name: String
}
