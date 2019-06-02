//
//  NetworkManager.swift
//  newsFeed
//
//  Created by Денис Сидоренко on 29/05/2019.
//  Copyright © 2019 Денис Сидоренко. All rights reserved.
//

import Foundation

// все либо мендeжеры либо сервесы

class NetworkManager {
    //MARK: Methosds
    class func getNews(requestUrl: URL, complition: @escaping (Result<NewsDataModel, Error>) -> Void ) {
        genericFetch(url: requestUrl, complition: complition)
    }
}

extension NetworkManager {
    class func genericFetch<T: Decodable>(url: URL, complition: @escaping(Result<T,Error>) -> Void) {
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if let error = error {
                complition(.failure(error))
            }
            if let data = data {
                print(data)
                do {
                    let json = try JSONDecoder().decode(T.self, from: data)
                    complition(.success(json))
                } catch {
                    complition(.failure(error))
                    return
                }
            }
        })
        task.resume()
    }
}
