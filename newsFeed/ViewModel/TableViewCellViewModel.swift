//
//  TableViewCellViewModel.swift
//  newsFeed
//
//  Created by Денис Сидоренко on 01/06/2019.
//  Copyright © 2019 Денис Сидоренко. All rights reserved.
//

import Foundation

class TableViewCellViewModel {
    
    //MARK: Properties
    private var news: NewsWorkModel
    var newUrlImage: String {
        return news.urlToImage
    }
    var title: String {
        return news.title
    }
    var newsUrl: String {
        return news.url 
    }
    var visited: Bool {
        return news.isvisited
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
}
