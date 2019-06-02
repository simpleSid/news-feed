//
//  DetailNewsViewModel.swift
//  newsFeed
//
//  Created by Денис Сидоренко on 02/06/2019.
//  Copyright © 2019 Денис Сидоренко. All rights reserved.
//

import Foundation

class DetailNewsViewModel {
    
    //Mark: properties
    var news: NewsWorkModel
    var newUrlImage: String {
        return news.urlToImage
    }
    var title: String {
        return news.title
    }
    var newUrl: String {
        return news.url ?? "no url"
    }
    var description: String {
        return news.description ?? "no description"
    }
    var publishedAt: String {
        return news.publishedAt ?? "no date"
    }
    
    init(news: NewsWorkModel) {
        self.news = news
    }
    
    //Mark: Methods
    func loadImage(complition: @escaping (Data?, String?) -> Void) {
        let imageManager = LoadImageManager()
        let proxy = Proxy(manager: imageManager)
        if let url = URL(string: newUrlImage) {
            proxy.loadImage(url: url) { (data, response, error) in
                guard let data = data, error == nil else {
                    complition(nil, "defoltNewsImage")
                    return
                }
                complition(data, nil)
            }
        }
    }
}
