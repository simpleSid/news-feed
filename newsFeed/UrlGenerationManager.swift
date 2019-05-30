//
//  UrlGenerationManager.swift
//  newsFeed
//
//  Created by Денис Сидоренко on 30/05/2019.
//  Copyright © 2019 Денис Сидоренко. All rights reserved.
//

import Foundation

class UrlGenerationManager {

    private var urlComponents = URLComponents()
    
    private var year = Calendar.current.component(Calendar.Component.year, from: Date())
    private var month = Calendar.current.component(Calendar.Component.month, from: Date())
    private var day = Calendar.current.component(Calendar.Component.day, from: Date())
    
    private var queryItems = [URLQueryItem]()

    
    func generate(text: String) -> URL? {
        queryItems.removeAll()
        queryItems.append(URLQueryItem(name: "q", value: "\(text)"))
        queryItems.append(URLQueryItem(name: "from", value: "\(year)-\(month)-\(day-1)"))
        queryItems.append(URLQueryItem(name: "sortBy", value: "publishedAt"))
        queryItems.append(URLQueryItem(name: "apiKey", value: "b59bc1f13f884301a259ebc4a7c68af2"))
        
        urlComponents.scheme = "https"
        urlComponents.host = "newsapi.org"
        urlComponents.path = "/v2/everything"
        urlComponents.queryItems = queryItems
        
        print(urlComponents.url?.absoluteURL)
        return(urlComponents.url?.absoluteURL)
    }

}
