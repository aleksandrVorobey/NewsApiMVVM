//
//  NetworkManager.swift
//  NewsApiMVVM
//
//  Created by Александр Воробей on 23.11.2021.
//

import Foundation

class NetworkManager {
        
    func baseRequest<T: Decodable>(url: String, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: url) else {
            completion(.failure(NetworkError.wrongURL))
            return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(.failure(NetworkError.dataIsNil))
                }
                return
            }
            print("Data is \(data)")
            do {
                let jsonDecoder = JSONDecoder()
                let decodedObject = try jsonDecoder.decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(decodedObject))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}

enum NetworkError: Error {
    case wrongURL
    case dataIsNil
}
