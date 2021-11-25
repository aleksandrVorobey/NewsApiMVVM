//
//  ImageManager.swift
//  NewsApiMVVM
//
//  Created by Александр Воробей on 24.11.2021.
//

import Foundation

class ImageManager {
    static let shared = ImageManager()
    private init() {}
    
    let imageCache = NSCache<NSString, NSData>()
    
    func getImageRequest(urlString: String, completion: @escaping (Data?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        
        if let cachedImage = imageCache.object(forKey: NSString(string: urlString)) {
            DispatchQueue.main.async {
                completion(cachedImage as Data)
            }
        } else {
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard  error == nil, let data = data else {
                    DispatchQueue.main.async {
                        completion(nil)
                    }
                    return
                }
                self.imageCache.setObject(data as NSData, forKey: NSString(string: urlString))
                DispatchQueue.main.async {
                    completion(data)
                }
            }.resume()
        }
    }
}

