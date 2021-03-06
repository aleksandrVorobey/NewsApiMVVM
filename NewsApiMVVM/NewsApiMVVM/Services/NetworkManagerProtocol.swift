//
//  NetworkManagerProtocol.swift
//  NewsApiMVVM
//
//  Created by Александр Воробей on 24.11.2021.
//

import Foundation

protocol NewsNetworkProtocol {
    func requestNews(paramPage: Int, completion: @escaping (Result<NewsResponse, Error>) -> Void)
}
