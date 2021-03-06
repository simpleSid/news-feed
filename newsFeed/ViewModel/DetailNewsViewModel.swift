//
//  DetailNewsViewModel.swift
//  newsFeed
//
//  Created by Денис Сидоренко on 02/06/2019.
//  Copyright © 2019 Денис Сидоренко. All rights reserved.
//

import Foundation

class DetailNewsViewModel {
    
    //MARK: properties
    var news: NewsWorkModel
    var newUrlImage: String {
        return news.urlToImage
    }
    var title: String {
        return news.title
    }
    var description: String {
        return news.description
    }
    var publishedAt: String {
        return news.publishedAt 
    }
    var url: String {
        return news.url 
    }
    init(news: NewsWorkModel) {
        self.news = news
    }
    
    //MARK: Methods
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
    
    func dateConvert() {
        news.publishedAt = DateFormateManager.dateConvert(dateString: news.publishedAt)
    }
}
