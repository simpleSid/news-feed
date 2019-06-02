//
//  Proxi.swift
//  newsFeed
//
//  Created by Денис Сидоренко on 30/05/2019.
//  Copyright © 2019 Денис Сидоренко. All rights reserved.
//

import Foundation

// тут надо все писать в file manager и брать оттуда
//var cacheDate: Data?

class Proxy: LoadImageManagerProtocol {
    //MARK: Properties
    private var manager: LoadImageManagerProtocol
    //MARK: Methods
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
