//
//  ViewModel.swift
//  newsFeed
//
//  Created by Денис Сидоренко on 31/05/2019.
//  Copyright © 2019 Денис Сидоренко. All rights reserved.
//

import Foundation

class NewsViewModel {
    
    var news: NewsDataModel?
    var workNews = [NewsWorkModel]()
    var urlGenerator = UrlGenerationManager()
    
    func cellViewModel(atIndexPath indexPath: IndexPath) -> TableViewCellViewModel {
        let news = workNews[indexPath.row]
        return TableViewCellViewModel(new: news)
    }
    
    func detailViewModel(atIndexPath indexPath: IndexPath) -> DetailNewsViewModel {
        let news = workNews[indexPath.row]
        return DetailNewsViewModel(news: news)
    }
    
    func numberOfRows() -> Int {
        return workNews.count
    }
    
    func transformToWorkNews() {
        workNews.removeAll()
        guard let articles = news?.articles else { return }
        for arcticle in articles {
            workNews.append(NewsWorkModel(title: arcticle.title ?? "title",
                                          urlToImage: arcticle.urlToImage ?? "urlToImage",
                                          isvisited: false,
                                          publishedAt: arcticle.publishedAt ?? "publishedAt",
                                          description: arcticle.description ?? "description",
                                          url: arcticle.url))
        }
    }
    
    func loadNews(text: String, complition: @escaping () -> Void ) {
        guard text.count >= 3, let url =  urlGenerator.generate(text: text) else { return }
        NetworkManager.getNews(requestUrl: url) { result in
            switch result {
            case .success(let json):
                self.news = json
                self.transformToWorkNews()
                complition()
            case .failure(let error):
                print(error)
            }
        }
    }
}
