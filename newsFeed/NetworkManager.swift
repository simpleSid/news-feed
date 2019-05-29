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
    class func getNews(requestText: String, complition: @escaping (Result<NewsDataModel, Error>) -> Void ) {
        // получать фото через паттерн proxi 8 lesson
        // urlseession по дефолту работает асинхронно удалить 110 строку
        // url components  посмотреть применить https://medium.com/swift2go/building-safe-url-in-swift-using-urlcomponents-and-urlqueryitem-alfian-losari-510a7b1f3c7e
        let urlString = "https://newsapi.org/v2/everything?q=\(requestText)&from=2019-04-29&sortBy=publishedAt&apiKey=b59bc1f13f884301a259ebc4a7c68af2"
        guard let url = URL(string: urlString) else { return }
        genericFetch(url: url, complition: complition)
    }
}

extension NetworkManager {
    class func genericFetch<T: Decodable>(url: URL, complition: @escaping(Result<T,Error>) -> Void) {
        //  чтобы быть крутым вставить код в любой класс и не переписывать при этом
        
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
