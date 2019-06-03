//
//  Proxi.swift
//  newsFeed
//
//  Created by Денис Сидоренко on 30/05/2019.
//  Copyright © 2019 Денис Сидоренко. All rights reserved.
//

import Foundation

class Proxy: LoadImageManagerProtocol {

    //MARK: Properties
    private var manager: LoadImageManagerProtocol
    
    //MARK: Methods
    init(manager: LoadImageManagerProtocol) {
        self.manager = manager
    }
    
    func loadImage(url: URL, complition: @escaping (Data?, URLResponse?, Error?) -> ()) {
        manager.loadImage(url: url) { (data, response, error) in
            complition(data,response,error)
        }
    }
}
