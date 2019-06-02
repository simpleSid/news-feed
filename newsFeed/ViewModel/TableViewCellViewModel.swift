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
    private var new: NewsWorkModel
    var newUrlImage: String {
        return new.urlToImage
    }
    var title: String {
        return new.title
    }
    var newUrl: String {
        return new.url ?? "non"
    }
    var visited: Bool {
        return new.isvisited
    }
    
    init(new: NewsWorkModel) {
        self.new = new
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
