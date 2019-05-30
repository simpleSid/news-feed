//
//  LoadImageManagerProtocol.swift
//  newsFeed
//
//  Created by Денис Сидоренко on 30/05/2019.
//  Copyright © 2019 Денис Сидоренко. All rights reserved.
//

import Foundation

protocol LoadImageManagerProtocol {
    func loadImage(url: URL, complition: @escaping (Data?, URLResponse?, Error?) -> ())
}
