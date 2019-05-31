//
//  NewsDataModel.swift
//  newsFeed
//
//  Created by Денис Сидоренко on 28/05/2019.
//  Copyright © 2019 Денис Сидоренко. All rights reserved.
//

import Foundation

struct NewsDataModel: Codable {
    let status: String
    let totalResults: Int?
    let articles: [Article]?
}

struct Article: Codable {
    let source: Source?
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}

struct Source: Codable {
    let id: String?
    let name: String?
}


struct Mymodel {
    let title: String
    let urlToImage: String
    var isvisited: Bool
    let publishedAt: String?
    let description: String?
    let url: String?
}
