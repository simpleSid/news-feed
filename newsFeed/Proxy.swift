//
//  Proxi.swift
//  newsFeed
//
//  Created by Денис Сидоренко on 30/05/2019.
//  Copyright © 2019 Денис Сидоренко. All rights reserved.
//

import Foundation

// тут надо все писать в core data и брать оттуда
//var cacheDate: Data?

class Proxy: LoadImageManagerProtocol {
    private var manager: LoadImageManagerProtocol
    
    init(manager: LoadImageManagerProtocol) {
        self.manager = manager
    }
    
    func loadImage(url: URL, complition: @escaping (Data?, URLResponse?, Error?) -> ()) {
//        if cacheDate == nil {
            manager.loadImage(url: url) { (data, response, error) in
//                cacheDate = data
                complition(data,response,error)
            }
//        } else {
//            complition(cacheDate,nil,nil)
//        }
    }
}
