//
//  LoadImageManager.swift
//  newsFeed
//
//  Created by Денис Сидоренко on 30/05/2019.
//  Copyright © 2019 Денис Сидоренко. All rights reserved.
//

import Foundation

class LoadImageManager: LoadImageManagerProtocol {
    func loadImage(url: URL, complition: @escaping (Data?, URLResponse?, Error?) -> ()) {
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .reloadIgnoringLocalCacheData
        config.urlCache = nil
        
        let session = URLSession.init(configuration: config)
        session.dataTask(with: url, completionHandler: complition).resume()
    }
}
